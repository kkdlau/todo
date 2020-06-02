import 'package:flutter/material.dart';

class BottomAddEventSheet extends StatefulWidget {
  BottomAddEventSheet({Key key}) : super(key: key);

  @override
  _BottomAddEventSheetState createState() => _BottomAddEventSheetState();
}

class _BottomAddEventSheetState extends State<BottomAddEventSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
      height: 160,
      child: Container(
        height: 125,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, color: Colors.grey[300], spreadRadius: 5)
            ]),
        child: Column(children: [
          Container(
              height: 50,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Enter name of a todo event',
                ),
              ))
        ]),
      ),
    );
  }
}
