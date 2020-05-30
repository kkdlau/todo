import 'package:flutter/material.dart';
import 'package:todo/widgets/event_type_page/simple_page.dart';
import 'event_type_btn.dart';

const List<String> options = ["Simple", "detail", "Assignment"];

class AddEventDialog extends StatefulWidget {
  AddEventDialog({Key key}) : super(key: key);

  @override
  _AddEventDialogState createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  List<bool> _selectType = [];

  @override
  void initState() {
    _selectType.add(true);
    for (int i = options.length - 1; i >= 1; i--) _selectType.add(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [SimpleEventPage()];
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            EventTypeToggleBtn(
              eventOptions: options,
              isSelected: _selectType,
              selectedEvent: (int index, String name) {
                setState(() {
                  _selectType = [
                    for (int i = 0; i < _selectType.length; i++) i == index
                  ];
                });
              },
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.6),
              child: PageView.builder(
                itemCount: pages.length,
                itemBuilder: (BuildContext context, int i) => pages[i],
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
