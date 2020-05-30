import 'package:flutter/material.dart';
import 'package:todo/widgets/toogle_btn.dart';

class EventTypeToggleBtn extends StatelessWidget {
  final List<String> eventOptions;
  final List<bool> isSelected;
  final void Function(int, String) selectedEvent;
  const EventTypeToggleBtn(
      {Key key, this.eventOptions, this.isSelected, this.selectedEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      for (String option in eventOptions)
        Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Text(option))
    ];
    return CustomToggleButton(
      btnContents: _children,
      isSelected: isSelected,
      onPressed: (index) {
        selectedEvent(index, eventOptions[index]);
      },
    );
  }
}
