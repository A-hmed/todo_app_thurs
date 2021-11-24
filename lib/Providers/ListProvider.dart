import 'package:flutter/material.dart';
import 'package:todo_app/DataBase/FireBaseUtils.dart';
import 'package:todo_app/DataBase/Models/Todo.dart';

class ListProvider extends ChangeNotifier{
  List<Todo> items=[];
  DateTime selectedDay=DateTime.now();
  void refreshTodo(){
    getTodosRefWithConverters().get().then((documentsSnapShot) {
      items= documentsSnapShot.docs.map((document)  {
        return document.data();
      }).toList();
      items.sort((Todo a,Todo b){
       return  a.dateTime.compareTo(b.dateTime);
      });
      notifyListeners();
    });
  }
  
  void setNewSelectedDay(DateTime newSelectedDay){
    selectedDay=newSelectedDay;
    notifyListeners();
  }
  
}