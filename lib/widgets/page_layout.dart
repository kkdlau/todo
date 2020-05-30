import 'package:flutter/material.dart';
import 'package:todo/widgets/event_dialog/add_event_dialog.dart';

class PageLayout extends StatefulWidget {
  PageLayout({Key key}) : super(key: key);

  @override
  _PageLayoutState createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(context: context, child: AddEventDialog());
          },
          child: Icon(Icons.add)),
    );
  }
}
