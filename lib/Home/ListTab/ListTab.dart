import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app/DataBase/FireBaseUtils.dart';
import 'package:todo_app/DataBase/Models/Todo.dart';
import 'package:todo_app/Providers/AppConfigProvider.dart';
import 'package:todo_app/Providers/ListProvider.dart';
import 'TodoItem.dart';

class ListTab extends StatefulWidget {

  @override
  _ListTabState createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  DateTime focusedDay=DateTime.now();
  ListProvider listProvider=ListProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(microseconds: 500,),(){
      listProvider.refreshTodo();
    });

  }

  @override
  Widget build(BuildContext context) {
   listProvider=Provider.of(context);

    AppConfigProvider provider=Provider.of(context);
    return Column(children: [
      Container(
        color: Colors.white,
        child: TableCalendar(
          firstDay:DateTime.now().subtract(Duration(days: 365)) ,
          lastDay: DateTime.now().add(Duration(days: 365)),
          focusedDay: focusedDay,
           headerVisible: false,
          selectedDayPredicate: (day) {
            return isSameDay(listProvider.selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              listProvider.setNewSelectedDay(selectedDay);
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
      ),
      Expanded(
        child: ListView.builder(
            itemCount: listProvider.items.length,
            itemBuilder: (context,index){
          return TodoItem(listProvider.items[index]);
        }),
      )
    ]);
  }

}
