import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tests/Helper/Constance/const_variable.dart';
import 'package:tests/Helper/Widgets/Custom/custom_widgets.dart';
import 'package:tests/State/State/switch_state.dart';
import 'package:tests/Views/Main/bottom_bar_screen.dart';
import 'package:tests/Views/Screens/Auth/Login/main_login_screen.dart';
import '../../Views/Screens/Auth/SignUp/main_signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Helper/Constance/const_regexp.dart';


class FunctionsAuth {

  static final Dio _dio = Dio(BaseOptions(
    baseUrl: baseUrl ,
  ));


  /// Validators \\\
  static String? validatorName(String? v) {
    return !v!.contains(regExpName) ? 'Enter your Name by write form' : null ;
  }

  static String? validatorEmail(String? v) {
    return !v!.contains(regExpEmail) ? 'Enter your Email by write form' : null ;
  }

  static String? validatorPhone(String? v) {
    return !v!.contains(regExpPhone) ? 'Enter your Phone by write form' : null;
  }

  static String? validatorPw(String? v) {
    return !v!.contains(regExpPw) ? '[UpperCase , LowerCase , \$ ,# ,%]' : null;
  }
  /// Validators \\\


  /// Routers \\\

  static goToMainPage(BuildContext context){
    return Navigator.of(context).maybePop();
  }

  static goToSignUpPage(BuildContext context) async {
    return await Navigator.of(context).pushNamed(MainSignUpScreen.mainSignUpScreen);
  }

  /// Routers \\\


  /// Authentication \\\
  static Future<void> loginButton({
    required GlobalKey<FormState> globalKey ,
    required BuildContext context ,
    required String email ,
    required String password ,
    required WidgetRef ref ,
    required ChangeNotifierProvider<SwitchState> state
}) async {
    if(globalKey.currentState!.validate()) {
      ref.read(state).falseSwitch();
      try {
        final Response _response = await _dio.postUri(
            Uri.parse('$baseUrl/api/login'),
            data: {
              'login': email ,
              "password": password
            }
        );

        final SharedPreferences _prefs = await SharedPreferences.getInstance();
        final Map<String, dynamic> _data = _response.data;

        if (_response.statusCode == 200) {
          await _prefs.setString('name', _data['data'][0]['name']);
          await _prefs.setString('email', _data['data'][0]['email']);
          await _prefs.setString('phone', _data['data'][0]['phone']);
          await _prefs.setString('image', _data['data'][0]['image']);

          ref.read(state).trueSwitch();

          Navigator.of(context).pushNamedAndRemoveUntil(BottomBarScreen.bottomBarScreen, (route) => false);
        } else {
          ref.read(state).trueSwitch();
          customSnackBar(text: 'Check your Email or Password', context: context);
        }
      }catch(e){
        ref.read(state).trueSwitch();
        customSnackBar(text: 'Check your Internet', context: context);
      }
    }
    ref.read(state).trueSwitch();
  }


  static Future<void> registerButton({
    required GlobalKey<FormState> globalKey ,
    required BuildContext context ,
    required String name ,
    required String email ,
    required String password ,
    required String phone ,
    required WidgetRef ref ,
    required ChangeNotifierProvider<SwitchState> state
}) async {
    if(globalKey.currentState!.validate()){
      ref.read(state).falseSwitch();

      int random1 = Random().nextInt(99999999);
      int random2 = Random().nextInt(88888888);
      int random3 = Random().nextInt(77777777);

      try {
       final Response _response = await _dio.postUri(Uri.parse(
            '$baseUrl/api/register'),
            data: {
              'name': name ,
              'email': email ,
              'password': password ,
              'phone': phone ,
              'device_token':'$random3 $random1 $random2 $random3 $random1 $random2'
            });

        final Map<String,dynamic> _data = _response.data;

        if(_response.statusCode == 200) {
          ref.read(state).trueSwitch();

          Navigator.of(context).pushNamedAndRemoveUntil(MainLoginScreen.mainLoginScreen, (route) => false);

        } else {
          ref.read(state).trueSwitch();

          customSnackBar(text: '${_data['errors']['email'][0]}', context: context);

        }
      } catch(e) {
        ref.read(state).trueSwitch();

        customSnackBar(text: 'Check your Internet', context: context);

      }
      ref.read(state).trueSwitch();

    }
    ref.read(state).trueSwitch();
  }

  /// Authentication \\\
}