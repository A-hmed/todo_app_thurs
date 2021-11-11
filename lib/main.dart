import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home/Home.dart';
import 'package:todo_app/MyTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/Providers/AppConfigProvider.dart';
void main() {
  runApp(ChangeNotifierProvider(
    create: (_)=>AppConfigProvider(),
      child: MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  String lang='en';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider=Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // Spanish, no country code
      ],
      locale:Locale(provider.appLanguage, '') ,

      theme:MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode:provider.themeMode ,
      routes: {
        Home.ROUTE_NAME:(_)=>Home()
      },
      initialRoute: Home.ROUTE_NAME,
    );
  }
}