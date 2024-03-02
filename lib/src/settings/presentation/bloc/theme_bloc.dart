import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_state.dart';

enum ThemeEvent { toggleDark, toggleLight }

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.lightThemeData);

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    switch (event) {
      case ThemeEvent.toggleDark:
        yield ThemeState.darkThemeData;
        setThemeData(ThemeState.darkThemeData);
        break;
      case ThemeEvent.toggleLight:
        yield ThemeState.lightThemeData;
        setThemeData(ThemeState.lightThemeData);
        break;
    }
  }

  void setThemeData(ThemeState themeState) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', ThemeState.isDarkTheme(themeState.themeData));
  }

void getThemeData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool('isDark');
    if(isDark != null && isDark){
      add(ThemeEvent.toggleDark);
    }else{
      add(ThemeEvent.toggleLight);
    }
  }
}