import 'package:flutter/material.dart';

class MyThemeData{

  static ThemeData lightTheme=ThemeData(
    primaryColor:Color(0xff5D9CEC),
    accentColor: Color.fromRGBO(184, 210, 180, 1.0),
   scaffoldBackgroundColor: Color(0xffb1cbaa),
  textTheme:TextTheme(
    headline1: TextStyle(
      fontSize:14,
      fontWeight: FontWeight.bold
    )
  ),
  );
      static ThemeData darkTheme=ThemeData(
      primaryColor:Color(0xff5D9CEC),
      accentColor: Color(0xff141922),
          scaffoldBackgroundColor:Color(0xff141922),
        textTheme:TextTheme(
            headline1: TextStyle(
              color: Colors.white,
                fontSize:14,
                fontWeight: FontWeight.bold
            )
        ),
  );
}