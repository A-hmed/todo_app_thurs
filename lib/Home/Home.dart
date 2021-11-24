import 'package:flutter/material.dart';
import 'package:todo_app/Home/AddTaskBottomSheet.dart';
import 'package:todo_app/Home/ListTab/ListTab.dart';
import 'package:todo_app/Home/SettingsTab/SettingsTab.dart';

class Home extends StatefulWidget {
  static final  ROUTE_NAME='Home';


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Widget> tabs=[
    ListTab(),
    SettingsTab()
  ];
   int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:tabs[currentIndex] ,
    //  body:
    appBar: AppBar(
      title: Text('To Do List'),
      toolbarHeight: MediaQuery.of(context).size.height*.1,
    ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
      floatingActionButton: FloatingActionButton(
        backgroundColor:Theme.of(context).primaryColor,
        onPressed: (){
          showAddTaskBottomSheet();
        },
        child:Icon(Icons.add,color: Colors.white,),
        shape: StadiumBorder(
            side: BorderSide(color:Colors.white, width: 4)),
      ),
      bottomNavigationBar: BottomAppBar(

        notchMargin: 8,
        clipBehavior:Clip.hardEdge,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          onTap: (index){
            currentIndex=index;
            setState(() {
            });
          },
          currentIndex: currentIndex,
         showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list) ,label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'settings')
          ],
        ),
      ),
    );
  }

  void showAddTaskBottomSheet() {
     showModalBottomSheet( elevation:100,clipBehavior:Clip.antiAlias,context: context, builder:(context){
       return AddTaskBottomSheet();
     } );
  }

}
