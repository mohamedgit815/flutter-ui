import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tests/Helper/Constance/const_color.dart';
import 'package:tests/Helper/Constance/const_variable.dart';
import 'package:tests/State/State/bottom_bar_state.dart';
import 'package:tests/constants.dart';


class BottomBarScreen extends ConsumerWidget with _MixinBottomBar {
  static const String bottomBarScreen = '/BottomBarScreen';
   BottomBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: mainWhiteColor,
        initialActiveIndex: 0 ,
        style: TabStyle.fixed ,
        onTap: (int v) {
          ref.read(_bottomProv).indexPage(v,context);
        },
        items: [

          TabItem(icon: Icon(Icons.home_outlined,color: ref.watch(_bottomProv).indexScreen == 0 ? _mainColor : mainBlackColor)),
          TabItem(icon: Icon(Icons.favorite_border_outlined,color: ref.read(_bottomProv).indexScreen == 1 ? _mainColor: mainBlackColor)),
          TabItem(icon: SvgPicture.asset('$assetsPath/logocamera.svg')),
          TabItem(icon: Icon(CupertinoIcons.chat_bubble,color: ref.read(_bottomProv).indexScreen == 2 ? _mainColor : mainBlackColor)),
          TabItem(icon: Icon(CupertinoIcons.person,color: ref.read(_bottomProv).indexScreen == 3 ? _mainColor : mainBlackColor)),

        ],),


      body: Stack(
          children: ref.read(_bottomProv).pages.asMap()
              .map((i, screen) => MapEntry(i,
              Offstage(offstage: ref.read(_bottomProv).indexScreen != i,child: screen,)))
              .values.toList()
        ),
    );
  }
}


mixin _MixinBottomBar {

  final _bottomProv = ChangeNotifierProvider<BottomBarState>((ref)=>BottomBarState());

  final Color _mainColor = constGradient.colors.first;

}