import 'package:flutter/material.dart';
import '../../main/responisve_builder.dart';
import 'mobile_favorite_page.dart';

class MainFavoriteScreen extends StatelessWidget {
  static const String mainFavoriteScreen = '/MainFavoriteScreen';
  const MainFavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilderScreen(
        mobile: MobileFavoritePage()
    );
  }
}
