import 'package:flutter/material.dart';
import 'package:todo/main.dart';
import 'package:todo/widgets/event_dialog/bottom_add_event_sheet.dart';

class TodoListManager extends StatefulWidget {
  TodoListManager({Key key}) : super(key: key);

  @override
  _TodoListManagerState createState() => _TodoListManagerState();
}

class _TodoListManagerState extends State<TodoListManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/add_todo_item.png',
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          Text(
            'Wow you are free! Are you really a HKUST student?\nClick "+" to add new todo!',
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          )
        ],
      )),
      floatingActionButton: AddEventButton(),
      // bottomSheet: BottomAddEventSheet(),
    );
  }
}

class AddEventButton extends StatelessWidget {
  const AddEventButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () async {
          // showBottomSheet(
          //     context: context, builder: (context) => BottomAddEventSheet());
          bool success = await canvas.launchAuthPage(context);
          if (success) {
            canvas.availableCourses().then((value) {
              value.forEach((element) {
                print(element['longName']);
              });
              canvas.availavleAssignments('29823').then((value) {
                value.forEach((element) {
                  print((element as Map)['name']);
                });
              });
            });
          }

          // showDialog(
          //   context: context,
          //   builder: (context) => AddEventDialog(),
          // );
        },
        child: Icon(Icons.add));
  }
}
