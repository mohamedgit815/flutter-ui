import 'dart:async';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:tests/Views/Main/bottom_bar_screen.dart';
import '../Login/main_login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  static String mainSplashScreen = '/splashScreen';
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 1000),() async {

      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      final String? _token = _prefs.getString('email');

      late String _screen;

      if(await Permission.microphone.request().isGranted
          &&
          await Permission.camera.request().isGranted){

        if(_token == '' || _token == null){
          _screen = MainLoginScreen.mainLoginScreen;
        } else {
          _screen = BottomBarScreen.bottomBarScreen;
        }

      } else {
        if(_token == '' || _token == null){
          _screen = MainLoginScreen.mainLoginScreen;
        } else {
          _screen = BottomBarScreen.bottomBarScreen;
        }
      }

      Navigator.of(context).pushNamedAndRemoveUntil(_screen, (route) => false);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
    );
  }
}
