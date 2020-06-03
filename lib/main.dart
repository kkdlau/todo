import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/hkust_canvas/HKUST_Canvas_API.dart';
import 'package:todo/notifier/theme_notifier.dart';
import 'package:todo/widgets/pages/collection_page.dart';
import 'package:todo/widgets/pages/splash_screen.dart';
import 'package:todo/widgets/pages/todo_list_manager_page.dart';
import 'package:todo/widgets/transcation/scale_fade_transition.dart';

final HKUSTCanvas canvas = HKUSTCanvas();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ThemeNotifier>(
        create: (BuildContext context) => ThemeNotifier(AppTheme.LIGHT),
      ),
    ], child: DueUSTApp());
  }
}

class DueUSTApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeNotifier _provider = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
        theme: _provider.theme,
        home: SplashScreen(
          postFrameCallback: (context) {
            // handle all initial stuffs
            Future.delayed(Duration(milliseconds: 1500)).then((value) {
              Navigator.pushReplacement(
                  context, ScaleFadeTransition(page: TodoListManager()));
            });
          },
        ));
  }
}
