import 'package:flutter/material.dart';

class ScaleFadeTransition extends PageRouteBuilder {
  final Widget page;
  ScaleFadeTransition({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: Tween<double>(
              begin: .0,
              end: 1.0,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInCirc,
            )),
            child: ScaleTransition(
              scale: Tween<double>(
                begin: .6,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInCirc,
                ),
              ),
              child: child,
            ),
          ),
        );
}
