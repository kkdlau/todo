import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:todo/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'event_dialog/add_event_dialog.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              bool success = await canvas.launchAuthPage(context);
              if (success) {
                canvas.availableCourses().then((value) {
                  value.forEach((element) {
                    print(element['longName']);
                  });
                });
              }
            },
            child: Icon(Icons.add)));
  }
}
