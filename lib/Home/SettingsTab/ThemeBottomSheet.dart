import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Providers/AppConfigProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ThemeBottomSheet extends StatefulWidget {

  @override
  _ThemeBottomSheetState createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider=Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
            onTap: (){
              provider.setNewTheme(ThemeMode.light);
            },
            child: getItemDesign(AppLocalizations.of(context)!.light,
                provider.themeMode==ThemeMode.light)),
        InkWell(
            onTap: (){
              provider.setNewTheme(ThemeMode.dark);
            },
            child: getItemDesign(AppLocalizations.of(context)!.dark,
                provider.themeMode==ThemeMode.dark)),
      ],
    );
  }
  Widget getItemDesign(String language,bool selected){
   if(selected){
     return    Container(
         margin: EdgeInsets.all(18),
         //padding: EdgeInsets.all(12),
         child: Row(
           children: [
             Text(language,textAlign: TextAlign.start,style:TextStyle(color: Theme.of(context).primaryColor ),),
             Spacer(),
             Icon(Icons.check,color: Theme.of(context).primaryColor,)
           ],
         ));
   }else {
     return Container(
         margin: EdgeInsets.all(18),
         //padding: EdgeInsets.all(),
         child: Text(language,textAlign: TextAlign.start,));
   }
  }
}
