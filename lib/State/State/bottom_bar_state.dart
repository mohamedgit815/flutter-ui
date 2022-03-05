import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:tests/screens/main_screen/main_screen_tabs/chats_tab.dart';
import '../../Views/Screens/AgoraScreen/agora_screen.dart';
import '../../Views/Screens/FavoriteScreen/main_favorite_screen.dart';
import '../../Views/Screens/HomeScreen/main_home_screen.dart';
import '../../Views/Screens/ProfileScreen/main_profile_tap_screen.dart';


class BottomBarState extends ChangeNotifier {
  int indexScreen = 0;

  final List<Widget> pages =  const [
    MainHomeScreen() ,
    MainFavoriteScreen() ,
    ChatsTab() ,
    MainProfileTabScreen()
  ];

   void indexPage(int v,BuildContext context) {
    switch(v){

      case 0 :
        notifyListeners();
         indexScreen = 0;
        break;
      case 1 :
        notifyListeners();
         indexScreen = 1;
        break;
      case 2:
        notifyListeners();
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AgoraVideoCallScreen(role: ClientRole.Broadcaster, channel: 'test')));
        break;
      case 3 :
        notifyListeners();
         indexScreen = 2;
        break;
      case 4 :
        notifyListeners();
         indexScreen = 3;
        break;
    }
  }
}