## 功能
> 像原生开发一样，输出打印调试所需的相关信息，便于开发调试！
- 输出 内容
- 输出 所在文件
- 输出 所在行
- 输出 所在列
- 仅在非 `Release` 模式下输出打印内容


## 效果

![](./assets/结果展示.png)


## 使用

```dart
// 直接使用FLog
FLog("flutter_log demo");

// mode：打印模式（默认值为debug）
FLog("flutter_log demo", mode: FLogMode.error);
```

`mode` 枚举如下：

```dart
enum FLogMode {
  debug,    // 💚 DEBUG
  warning,  // 💛 WARNING
  info,     // 💙 INFO
  error,    // ❤️ ERROR
}
```


## 其它说明

源码中使用的 `Chain` 需要导包 `import 'package:stack_trace/stack_trace.dart';`

这个 `stack_trace` 在 `Flutter` 下自动集成，而纯 `Dart` 下没有，如果想在纯 `Dart` 下使用该功能，只需要如下添加依赖即可。

```yaml
dependencies:
  stack_trace: ^1.9.3
```

## 相关文章

[Flutter - 打印好用的Debug日志](https://juejin.im/post/59ee05346fb9a0452845a7e8) -- [【个人博客】](https://linxunfeng.top/2020/06/26/flutter/flutter%20-%20打印好用的debug日志/)
[【掘金】](https://juejin.cn/post/6844904199558283271)
[【全栈行动】](https://fullstackaction.com/pages/a9e62e/)

## Author

- LinXunFeng
- email: [linxunfeng@yeah.net](mailto:linxunfeng@yeah.net)
- Blogs: [全栈行动](https://fullstackaction.com/) | [LinXunFeng‘s Blog](http://linxunfeng.top/)  | [掘金](https://juejin.im/user/58f8065e61ff4b006646c72d/posts) 

<img height="267.5" width="481.5" src="https://github.com/LinXunFeng/LinXunFeng/blob/master/static/img/FSAQR.png" />


