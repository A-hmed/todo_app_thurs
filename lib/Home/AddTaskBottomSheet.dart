import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {


  @override
  _AddTaskBottomSheetState createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime date=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          margin: EdgeInsets.all(12),
            child: Text('Add New Task ',style: Theme.of(context).textTheme.headline2,)),

        TextField(
          decoration: InputDecoration(
            labelText: 'Enter Task title',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter task Descreption',
          ),
          minLines: 3,
          maxLines: 3,
        ),
        InkWell(
           onTap: (){
             showMyDatePicker();
           },
          child: Container(
              margin: EdgeInsets.all(12),
              child: Text('Select date ',style: Theme.of(context).textTheme.headline2,)),
        ),
        Container(
            margin: EdgeInsets.all(12),
            child: Text(date.toString(),style: Theme.of(context).textTheme.headline2,))

      ],
    );
  }

  void showMyDatePicker() {
   showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now() ,
        lastDate: DateTime.now().add(Duration(days: 365))).then((date) {

          this.date=date;
          setState(() {

          });
   });
  }
}
