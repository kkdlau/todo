import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final void Function(BuildContext) postFrameCallback;
  SplashScreen({Key key, this.postFrameCallback}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  bool called;

  @override
  void initState() {
    super.initState();
    called = false;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!called && widget.postFrameCallback != null) {
        called = true;
        widget.postFrameCallback(context);
      }
    });
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 188, 90, 1.0),
      body: Center(
          child: AnimatedOpacity(
              child: Image.asset('assets/logo.png'),
              animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: _controller, curve: Curves.easeOutCirc)))),
    );
  }
}

class AnimatedOpacity extends AnimatedWidget {
  final Widget child;
  const AnimatedOpacity({Key key, this.child, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.translate(
      offset: Offset(0, 30 * (1 - animation.value)),
      child: Opacity(
        opacity: animation.value,
        child: child,
      ),
    );
  }
}
