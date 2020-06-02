import 'package:flutter/material.dart';

class AddEventDialogNotifier with ChangeNotifier {
  final List<String> options;
  final Map<String, dynamic> setting;
  Map<String, dynamic> eventInfo;

  AddEventDialogNotifier({this.options, this.setting = const {}}) {
    if (setting != const {}) {
      eventInfo = setting;
      return;
    }
    options.forEach((String e) {
      eventInfo[e] = {};
    });
  }

  updatEventInfo(String eventType, Map<String, dynamic> members) {
    members.forEach((key, value) {
      eventInfo[eventType][key] = value;
    });
    notifyListeners();
  }
}
