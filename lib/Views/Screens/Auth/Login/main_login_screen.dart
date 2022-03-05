import 'package:flutter/material.dart';
import 'package:tests/Views/Screens/Auth/Login/mobile_login_page.dart';
import '../../../main/responisve_builder.dart';

class MainLoginScreen extends StatelessWidget {
  static const String mainLoginScreen = '/MainLoginScreen';
  const MainLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilderScreen(
        mobile: MobileLoginPage()
    );
  }
}
