import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home/SettingsTab/LanguageBottomSheet.dart';
import 'package:todo_app/Home/SettingsTab/ThemeBottomSheet.dart';
import 'package:todo_app/Providers/AppConfigProvider.dart';

class SettingsTab extends StatefulWidget {

  const SettingsTab({Key key}) : super(key: key);

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider=Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.all(12),
            child: Text(AppLocalizations.of(context).language,textAlign: TextAlign.start,
              style:Theme.of(context).textTheme.headline1 ,)
        ),
        InkWell(
          onTap: (){
            showLanguageBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Row(
              children: [
                Text(provider.appLanguage=='en'?'English':'العربيه'),
                Spacer(),
                Icon(Icons.arrow_downward_outlined)
              ],
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.all(12),
            child: Text(AppLocalizations.of(context).mode,textAlign: TextAlign.start,
              style:Theme.of(context).textTheme.headline1 ,)
        ),
        InkWell(
          onTap: (){
            showThemeBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white
            ),
            child: Row(
              children: [
                Text(provider.themeMode==ThemeMode.light?
                AppLocalizations.of(context).light:
                AppLocalizations.of(context).dark  ),
                Spacer(),
                Icon(Icons.arrow_downward_outlined)
              ],
            ),
          ),
        )
      ],
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context, builder:(context){
      return LanguageBottomSheet();
    } );
  }
  void showThemeBottomSheet() {
    showModalBottomSheet(context: context, builder:(context){
      return ThemeBottomSheet();
    } );
  }
}
