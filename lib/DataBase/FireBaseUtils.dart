import 'package:cloud_firestore/cloud_firestore.dart';

import 'Models/Todo.dart';

CollectionReference<Todo> getTodosRefWithConverters(){
  return FirebaseFirestore.instance.
  collection('todos').
    withConverter<Todo>(
    fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
    toFirestore: (todo, _) => todo.toJson(),
  );
}

void addTodoToFireStore(Todo todo){
  DocumentReference doc = getTodosRefWithConverters().doc();
  todo.id = doc.id;
  Todo newTodo=Todo(id:doc.id,title: todo.title,descreption: todo.descreption,dateTime: todo.dateTime);
  print('id is ${todo.id}');
   doc.set(newTodo).catchError((error) {
    print('in on error  ${error.toString()}');
  }).timeout(Duration(microseconds: 500), onTimeout: () {
    print('timeout');
  });
}