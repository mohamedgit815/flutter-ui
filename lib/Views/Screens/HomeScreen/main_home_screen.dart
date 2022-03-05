import 'package:flutter/material.dart';
import '../../main/responisve_builder.dart';
import 'mobile_home_page.dart';

class MainHomeScreen extends StatelessWidget {
  static const String mainHomeScreen = '/MainHomeScreen';
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilderScreen(
        mobile: MobileHomePage()
    );
  }
}
