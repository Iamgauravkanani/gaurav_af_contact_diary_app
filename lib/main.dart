import 'package:af_6/Models/theme_model.dart';
import 'package:af_6/Provider/counter_provider.dart';
import 'package:af_6/Provider/theme_provider.dart';
import 'package:af_6/utils/Globals.dart';
import 'package:af_6/views/Screens/add_contact_page.dart';
import 'package:af_6/views/Screens/details_page.dart';
import 'package:af_6/views/Screens/hidden_contact_page.dart';
import 'package:af_6/views/Screens/home_page.dart';
import 'package:af_6/views/Screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();

  bool isThemeDark = pref.getBool("isthemeDark") ?? false;

  bool visited = pref.getBool("isIntroVisited") ?? false; //bool or false
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(
            themeModel: ThemeModel(isDark: isThemeDark),
          ),
        ),
        ChangeNotifierProvider(create: (context) => Globals()),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // textTheme: TextTheme(
            //     displayLarge: TextStyle(
            //         color: Colors.indigo,
            //         fontSize: 30,
            //         fontWeight: FontWeight.bold)),
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.yellow,
            )
            // colorScheme: ColorScheme.light(
            //   brightness: Brightness.light,
            //   primary: Colors.redAccent,
            //   secondary: Colors.blueGrey,
            // ),
            ),
        darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: Brightness.dark,
            )
            // appBarTheme: AppBarTheme(backgroundColor: Colors.amber),
            // colorScheme: ColorScheme.dark(
            //   brightness: Brightness.dark,
            //   primary: Colors.yellow,
            //   secondary: Colors.green,
            // ),
            ),
        themeMode:
            (Provider.of<ThemeProvider>(context).themeModel.isDark == false)
                ? ThemeMode.dark
                : ThemeMode.light,
        initialRoute: (visited) ? 'Home_Page' : '/',
        routes: {
          '/': (context) => Intro_Screen(),
          'Home_Page': (context) => HomePage(),
          'add_contact_page': (context) => Add_Contact_Page(),
          'contact_details_page': (context) => Contact_Details_page(),
          'hidden_page': (context) => Hidden_Page(),
        },
      ),
    ),
  );
}
