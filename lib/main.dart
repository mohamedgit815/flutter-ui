import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:tests/Helper/Constance/const_color.dart';
import 'package:tests/Views/Main/routers.dart';
import 'package:tests/constants.dart';
import 'Views/Screens/Auth/SplashScreen/splash_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => const ProviderScope(child: MyApp())));

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true ,
      splitScreenMode: true ,
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false ,
        routes: Routes.router ,
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return widget!;
        },
        initialRoute: SplashScreen.mainSplashScreen ,
        //  initialRoute: MainScreen.id,
      //  initialRoute: BottomBarScreen.bottomBarScreen,
        theme: ThemeData(
            primaryColor: constGradient.colors.first,
            progressIndicatorTheme: ProgressIndicatorThemeData(
              color: constGradient.colors.first ,
              circularTrackColor: mainWhiteColor ,
              linearTrackColor: mainWhiteColor ,
            ) ,
            inputDecorationTheme: InputDecorationTheme(
              filled: true ,
              focusColor: constGradient.colors.first ,
              prefixIconColor: constGradient.colors.first ,
              suffixIconColor: constGradient.colors.first ,
              iconColor: constGradient.colors.first ,
            )
        ),
      ),
    );
  }
}