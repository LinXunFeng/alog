

## 使用



```dart
// 直接使用FLog
FLog("flutter_log demo");

// mode：打印模式（默认值为debug）
FLog("flutter_log demo", mode: FLogMode.values[_modeIndex]);
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



## 效果

![](./assets/结果展示.png)

