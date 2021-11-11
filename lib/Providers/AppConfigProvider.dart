import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{

  String appLanguage='ar';
   ThemeMode themeMode=ThemeMode.dark;

  void setNewLanguage(String newLang){
    if(appLanguage== newLang) return ;
    appLanguage=newLang;
    notifyListeners();
  }

  void setNewTheme(ThemeMode mode){
    if(themeMode== mode) return ;
    themeMode=mode;
    notifyListeners();
  }
}