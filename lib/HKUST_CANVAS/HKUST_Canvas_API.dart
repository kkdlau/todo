import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HKUSTCanvas with ChangeNotifier {
  bool signed = false;
  FlutterWebviewPlugin _webview;

  HKUSTCanvas() {
    _webview = FlutterWebviewPlugin();
    _webview.onUrlChanged.listen((event) {
      print(event);
      if (event == 'https://canvas.ust.hk/?login_success=1') {
        visible = false;
        signed = true;
        print('HKUST Canvas API is available now.');
        Future.delayed(Duration(seconds: 1)).then((value) {
          visible = true;
        });
        availableCourses().then((value) {
          value.forEach((element) {
            print(element['longName']);
          });
        });
      }
    });
  }

  set visible(bool _visible) {
    _visible ? _webview.show() : _webview.hide();
  }

  void launchAuthentication() {
    visible = true;
    _webview.launch(
        'https://access.ust.hk/cas/login?service=https://canvas.ust.hk/login/cas',
        userAgent:
            'Mozilla/5.0 (iPhone; CPU iPhone OS 11_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E217',
        withJavascript: true);
  }

  Future<String> apiRequestHandler(String url) async {
    visible = false;
    await _webview.reloadUrl(url);
    return await _webview
        .evalJavascript("document.getElementsByTagName(\"pre\")[0].innerText");
  }

  Future<List> availableCourses() async {
    String _courses = await apiRequestHandler(
        'https://canvas.ust.hk/api/v1/dashboard/dashboard_cards');
    if (_courses.contains("unauthenticated")) {
      throw Exception("Authentication failed. Please Login again.");
    } else {
      return json.decode(_courses.split(";")[1]);
    }
  }

  Future<List> availavleAssignments(String courseCode) async {
    String _asms = await apiRequestHandler(
        'https://canvas.ust.hk/api/v1/courses/' + courseCode + '/assignments/');
    if (_asms.contains("unauthenticated")) {
      throw Exception("Authentication failed. Please Login again.");
    } else {
      return json.decode(_asms.split(";")[1]);
    }
  }
}
