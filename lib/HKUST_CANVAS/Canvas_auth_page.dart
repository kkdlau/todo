import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CanvasAuthPage extends StatefulWidget {
  CanvasAuthPage({Key key}) : super(key: key);

  @override
  _CanvasAuthPageState createState() => _CanvasAuthPageState();
}

class _CanvasAuthPageState extends State<CanvasAuthPage> {
  FlutterWebviewPlugin _controller;
  @override
  Widget build(BuildContext context) {
    _controller = FlutterWebviewPlugin();
    _controller.onUrlChanged.listen((event) {
      if (event == "https://canvas.ust.hk/?login_success=1") {
        print('HKUST Canvas API is available now.');
        _controller.getAllCookies('https://access.ust.hk').then((value) {
          Navigator.pop<String>(context, value);
        });
      }
    });
    return WebviewScaffold(
        appBar: AppBar(
          title: Text('Login to HKUST Canvas'),
        ),
        withJavascript: true,
        withLocalStorage: true,
        userAgent:
            'Mozilla/5.0 (iPhone; CPU iPhone OS 11_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E217',
        url:
            'https://access.ust.hk/cas/login?service=https://canvas.ust.hk/login/cas');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
