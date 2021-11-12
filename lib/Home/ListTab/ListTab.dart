import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app/Providers/AppConfigProvider.dart';

import 'TodoItem.dart';

class ListTab extends StatefulWidget {
  const ListTab({Key key}) : super(key: key);

  @override
  _ListTabState createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {

  DateTime selectedDay=DateTime.now();
  DateTime focusedDay=DateTime.now();
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider=Provider.of(context);
    return Column(children: [
      TableCalendar(
        firstDay:DateTime.now().subtract(Duration(days: 365)) ,
        lastDay: DateTime.now().add(Duration(days: 365)),
        focusedDay: focusedDay,
         headerVisible: false,
        selectedDayPredicate: (day) {
          return isSameDay(selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            this.selectedDay = selectedDay;
            this.focusedDay = focusedDay; // update `_focusedDay` here as well
          });
        },
        daysOfWeekHeight: 25,
        locale:provider.appLanguage,
        calendarFormat: CalendarFormat.week,
        daysOfWeekStyle: DaysOfWeekStyle(decoration: BoxDecoration(color: Colors.white)),
        calendarStyle: CalendarStyle(
          weekendDecoration: BoxDecoration(color: Colors.white),
           defaultDecoration: BoxDecoration(color:Colors.white )
            ,selectedDecoration:BoxDecoration(color: Theme.of(context).primaryColor),
          isTodayHighlighted: false
        ),
      ),
      Expanded(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context,index){
          return TodoItem();
        }),
      )
    ]);
  }
}
