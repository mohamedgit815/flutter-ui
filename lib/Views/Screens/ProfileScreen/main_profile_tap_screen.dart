import 'package:flutter/material.dart';
import '../../main/responisve_builder.dart';
import 'mobile_profile_tap_page.dart';

class MainProfileTabScreen extends StatelessWidget {
  const MainProfileTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilderScreen(
        mobile: MobileProfileTabPage()
    );
  }
}
