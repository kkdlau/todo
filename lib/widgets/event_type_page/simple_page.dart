import 'package:flutter/material.dart';

class SimpleEventPage extends StatefulWidget {
  SimpleEventPage({Key key}) : super(key: key);

  @override
  _SimpleEventPageState createState() => _SimpleEventPageState();
}

class _SimpleEventPageState extends State<SimpleEventPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // final AddEventDialogNotifier eventInfo =
    //     Provider.of<AddEventDialogNotifier>(context);
    return Container(
      child: TextField(),
    );
  }

  @mustCallSuper
  bool get wantKeepAlive => true;
}
