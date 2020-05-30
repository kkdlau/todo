import 'package:flutter/material.dart';

class CustomToggleButton extends StatelessWidget {
  final Axis btnDirection;
  @required
  final List<Widget> btnContents;
  @required
  final List<bool> isSelected;
  final double roundedRadius;
  final bool expand;
  final void Function(int) onPressed;

  const CustomToggleButton(
      {Key key,
      this.btnDirection = Axis.horizontal,
      this.btnContents,
      this.roundedRadius = 0.0,
      this.expand = true,
      this.isSelected,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _btns = [
      for (int i = 0; i < btnContents.length; i++)
        OutlineButton(
            autofocus: isSelected[i],
            onPressed: () {
              onPressed(i);
            },
            child: btnContents[i])
    ];
    if (btnDirection == Axis.horizontal) {
      return Row(
        children: _btns,
      );
    } else {
      return Column(
        children: _btns,
      );
    }
  }
}
