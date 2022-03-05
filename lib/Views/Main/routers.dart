import 'package:tests/screens/fans_screen/fans_screen.dart';
import 'package:tests/screens/leader_board_screen/leader_board_screen.dart';
import 'package:tests/screens/search_screen/search_screen.dart';

import '../Screens/Auth/Login/main_login_screen.dart';
import '../Screens/FavoriteScreen/main_favorite_screen.dart';
import '../Screens/HomeScreen/main_home_screen.dart';
import '../Screens/Auth/SignUp/main_signup_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../Screens/Auth/SplashScreen/splash_screen.dart';


class Routes{

 static Map<String,WidgetBuilder> router = {
    LeaderBoard.id:(context)=> const LeaderBoard(),
    FansScreen.id:(context)=> const FansScreen(),
    SearchScreen.id:(context)=> const SearchScreen(),


    MainLoginScreen.mainLoginScreen : (context)=> const MainLoginScreen() ,
    SplashScreen.mainSplashScreen: (context) => const SplashScreen() ,
    MainSignUpScreen.mainSignUpScreen : (context)=> const MainSignUpScreen() ,
    MainHomeScreen.mainHomeScreen : (context)=> const MainHomeScreen() ,
    MainFavoriteScreen.mainFavoriteScreen : (context)=> const MainFavoriteScreen()
  };

}