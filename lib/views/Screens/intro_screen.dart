import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro_Screen extends StatefulWidget {
  const Intro_Screen({Key? key}) : super(key: key);

  @override
  State<Intro_Screen> createState() => _Intro_ScreenState();
}

class _Intro_ScreenState extends State<Intro_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
              body: "Screen 1",
              title: "Welcome to My App",
              image: FlutterLogo(
                size: 200,
              )),
          PageViewModel(
              body: "Screen 2",
              title: "Next to  My App",
              image: FlutterLogo(
                size: 200,
              )),
        ],
        done: Text("Thank You"),
        showNextButton: false,
        onDone: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();

          pref.setBool("isIntroVisited", true);
          Navigator.of(context).pushNamed("Home_Page");
        },
      ),
    );
  }
}
