import 'package:af_6/Models/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel themeModel;

  ThemeProvider({required this.themeModel});

  void changeTheme() async {
    themeModel.isDark = !themeModel.isDark;
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isthemeDark", themeModel.isDark);

    notifyListeners();
  }
}
