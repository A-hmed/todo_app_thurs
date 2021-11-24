import 'package:cloud_firestore/cloud_firestore.dart';

class Todo{
  late String title;
  late String descreption;
  late bool isDone;
  late DateTime dateTime;
  late String id;
  Todo({ this.id='',required this.title,required this.descreption,
    required this.dateTime, this.isDone=false});

      Todo.fromJson(Map<String,Object?> json){
        Timestamp timestamp=json['dateTime'] as Timestamp;
      id=json['id'] as String;
    title=json['title'] as String;
    descreption= json['descreption'] as String;
        isDone=json['isDone'] as bool;
        dateTime=timestamp.toDate();
  }

  Map<String, Object> toJson() {
    return {
      'id':id,
      'title': title,
      'descreption': descreption,
      'isDone':isDone,
      'dateTime':dateTime,
    };
  }
}