import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Providers/AppConfigProvider.dart';

class TodoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider=Provider.of(context);
    return Slidable(

      child: Container(
        margin: EdgeInsets.only(top: 12,bottom: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: provider.themeMode==ThemeMode.light?Colors.white:Color(0xff0c1940),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right:provider.appLanguage=='en'?12:0 ),
              color: Theme.of(context).primaryColor,
              width: 4,
              height: 60,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Play basketBall',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Theme.of(context).primaryColor) ,),
                Text('Play basketBall',style:Theme.of(context).textTheme.headline2 )
              ],
            ),
            Spacer(),
            Image.asset('assets/icon_check.png')
          ],
        ),
      ),

      startActionPane: ActionPane(
        extentRatio: .3,
        motion:StretchMotion(),
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 12,bottom: 12),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text(
                    'Delete',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
