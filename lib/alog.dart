// Copyright [2020] LinXunFeng
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart';

enum ALogMode {
  debug,    // 💚 DEBUG
  warning,  // 💛 WARNING
  info,     // 💙 INFO
  error,    // ❤️ ERROR
}

String ALog(dynamic msg, { ALogMode mode = ALogMode.debug }) {
  if (kReleaseMode) { // release模式不打印
    return "";
  }
  var chain = Chain.current(); // Chain.forTrace(StackTrace.current);
  // 将 core 和 flutter 包的堆栈合起来（即相关数据只剩其中一条）
  chain = chain.foldFrames((frame) => frame.isCore || frame.package == "flutter");
  // 取出所有信息帧
  final frames = chain.toTrace().frames;
  // 找到当前函数的信息帧
  final idx = frames.indexWhere((element) => element.member == "ALog");
  if (idx == -1 || idx+1 >= frames.length) {
    return "";
  }
  // 调用当前函数的函数信息帧
  final frame = frames[idx+1];

  var modeStr = "";
  switch(mode) {
    case ALogMode.debug:
      modeStr = "💚 DEBUG";
      break;
    case ALogMode.warning:
      modeStr = "💛 WARNING";
      break;
    case ALogMode.info:
      modeStr = "💙 INFO";
      break;
    case ALogMode.error:
      modeStr = "❤️ ERROR";
      break;
  }

  final printStr = "$modeStr ${frame.uri.toString().split("/").last}(${frame.line}) - $msg ";
  debugPrint(printStr);
  return printStr;
}