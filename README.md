# flutter_macos_widget

Flutter Library for macOS WidgetKit and Widget Communication


## 💡 Usage
### 1. Flutter
```dart
import 'package:flutter_macos_widget/flutter_macos_widget.dart';


final widgetKit = FlutterMacosWidget("appGroup");


// use "UseDefaults" to communicate with Widget
widgetKit.set("key", "value")
widgetKit.get("key")
widgetKit.remove("key")

// force reload macOS widget
FlutterMacosWidget.reloadAllTimelines();
FlutterMacosWidget.reloadTimelines("ofKind");
```
### 2. Swift
```swift
let value = UserDefaults(suiteName: "appGroup")!.string(forKey: "key")
```


