import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_macos_widget/flutter_macos_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final widgetKit = FlutterMacosWidget("4X59PHA385.com.example");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final textController1 = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter MacOS Widget Example'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter Value',
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: TextField(controller: textController)),
            TextButton(
                onPressed: () {
                  widgetKit.set('value', textController.text);
                  FlutterMacosWidget.reloadAllTimelines();
                },
                child: Text('Update')),
            TextButton(
                onPressed: () {
                  widgetKit.remove('value');
                  FlutterMacosWidget.reloadAllTimelines();
                },
                child: Text('Remove')),
            TextButton(
                onPressed: () async {
                  textController1.text = await widgetKit.get("value");
                },
                child: Text('Get')),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: TextField(controller: textController1)),
          ],
        )),
      ),
    );
  }
}
