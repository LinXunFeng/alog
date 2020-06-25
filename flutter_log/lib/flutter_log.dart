import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart';

enum FLogMode {
  debug,    // 💚 DEBUG
  warning,  // 💛 WARNING
  info,     // 💙 INFO
  error,    // ❤️ ERROR
}

String FLog(dynamic msg, { FLogMode mode = FLogMode.debug }) {
  if (kReleaseMode) { // release模式不打印
    return "";
  }
  var chain = Chain.forTrace(StackTrace.current);
  chain = chain.foldFrames((frame) => frame.isCore || frame.package == "flutter");
  final frames = chain.toTrace().frames;
  final idx = frames.indexWhere((element) => element.member == "FLog");
  if (idx == -1 || idx+1 >= frames.length) {
    return "";
  }
  final frame = frames[idx+1];

  var modeStr = "";
  switch(mode) {
    case FLogMode.debug:
      modeStr = "💚 DEBUG";
      break;
    case FLogMode.warning:
      modeStr = "💛 WARNING";
      break;
    case FLogMode.info:
      modeStr = "💙 INFO";
      break;
    case FLogMode.error:
      modeStr = "❤️ ERROR";
      break;
  }

  final printStr = "$modeStr ${frame.uri.toString().split("/").last}(${frame.line}) - $msg ";
  print(printStr);
  return printStr;
}