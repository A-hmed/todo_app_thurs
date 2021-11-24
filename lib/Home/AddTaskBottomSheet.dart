import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/DataBase/FireBaseUtils.dart';
import 'package:todo_app/DataBase/Models/Todo.dart';
import 'package:todo_app/Providers/ListProvider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  _AddTaskBottomSheetState createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime? dateTime = DateTime.now();
  String title = '';
  String descreption = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ListProvider listProvider=Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            margin: EdgeInsets.all(12),
            child: Text(
              'Add New Task ',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            )),
        Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                onChanged: (text) {
                  title = text;
                },
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Enter title here';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Enter Task title',
                ),
              ),
              TextFormField(
                onChanged: (text) {
                  descreption = text;
                },
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Enter Decreption here';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Enter task Descreption',
                ),
                minLines: 3,
                maxLines: 3,
              ),
            ],
          ),
        ),
        Container(
            width: double.infinity,
            margin: EdgeInsets.all(16),
            child: Text(
              'Select date ',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.start,
            )),
        InkWell(
          onTap: () {
            showMyDatePicker();
          },
          child: Container(
              margin: EdgeInsets.all(12),
              child: Text(
                dateTime.toString(),
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              )),
        ),
        Spacer(),
        Container(
            margin: EdgeInsets.all(16),
            child: ElevatedButton(onPressed: (){
              addTodo();
              listProvider.refreshTodo();
            }, child: Text('Add')))
      ],
    );
  }

  void addTodo() {

    if(!formKey.currentState!.validate()) return;
    Todo todo =
        Todo(title: title, descreption: descreption, dateTime:dateTime! );
    addTodoToFireStore(todo);
    Navigator.pop(context);
  }

  void showMyDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365)))
        .then((date) {
      if (date != null) {
        this.dateTime = date;
        setState(() {});
      }
    });
  }
}
