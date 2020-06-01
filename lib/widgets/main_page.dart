import 'package:flutter/material.dart';

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
          onPressed: () {
            // showDialog(context: context, child: AddEventDialog());
          },
          child: Icon(Icons.add)),
    );
  }
}
