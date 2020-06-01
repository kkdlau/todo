import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/hkust_canvas/HKUST_Canvas_API.dart';
import 'package:todo/style/theme_notifier.dart';
import 'package:todo/widgets/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (BuildContext context) => ThemeNotifier(AppTheme.LIGHT),
        ),
        ChangeNotifierProvider<HKUSTCanvas>(
            create: (BuildContext context) => HKUSTCanvas())
      ],
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MainPage()),
    );
  }
}
