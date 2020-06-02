import 'package:flutter/material.dart';

class PageLayout extends StatefulWidget {
  PageLayout({Key key}) : super(key: key);

  @override
  _PageLayoutState createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Tasks'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (result) {},
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                    value: "",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.format_paint,
                          color: Colors.grey,
                        ),
                        Text('變更佈景主題'),
                      ],
                    )),
              ];
            },
          )
        ],
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {},
          child: Icon(Icons.add)),
    );
  }
}
