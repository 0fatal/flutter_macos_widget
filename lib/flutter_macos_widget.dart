import 'dart:async';

import 'package:flutter/services.dart';

class FlutterMacosWidget {
  static final _channel = const MethodChannel('flutter_macos_widget');
  String appGroup;

  FlutterMacosWidget(this.appGroup);

  static void reloadAllTimelines() async {
    await _channel.invokeMethod('reloadAllTimelines');
  }

  static void reloadTimelines(String ofKind) async {
    await _channel
        .invokeMethod('reloadTimelines', <String, dynamic>{'ofKind': ofKind});
  }

  static dynamic getItem(String key, String appGroup) async {
    return await _channel.invokeMethod(
        'getItem', <String, dynamic>{'key': key, 'appGroup': appGroup});
  }

  static dynamic setItem(String key, dynamic value, String appGroup) async {
    return await _channel.invokeMethod('setItem',
        <String, dynamic>{'key': key, 'value': value, 'appGroup': appGroup});
  }

  static Future<bool> removeItem(String key, String appGroup) async {
    return await _channel.invokeMethod(
        'removeItem', <String, dynamic>{'key': key, 'appGroup': appGroup});
  }

  dynamic get(String key) async {
    return await _channel.invokeMethod(
        'getItem', <String, dynamic>{'key': key, 'appGroup': appGroup});
  }

  dynamic set(String key, dynamic value) async {
    return await _channel.invokeMethod('setItem',
        <String, dynamic>{'key': key, 'value': value, 'appGroup': appGroup});
  }

  Future<bool> remove(String key) async {
    return await _channel.invokeMethod(
        'removeItem', <String, dynamic>{'key': key, 'appGroup': appGroup});
  }
}
