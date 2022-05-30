import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Tiwee/presentation/screens/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff1a1726)
  ));*/
  SystemChrome.setEnabledSystemUIOverlays([]);
  /*SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]) //Ricky：固定裝置的轉向 橫向

      .then((value) =>
      runApp(ProviderScope(
        child: MaterialApp(
          themeMode: ThemeMode.system,


          title: "Tiwee",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(textTheme: GoogleFonts.soraTextTheme(),
          scaffoldBackgroundColor: Color(0xff1a1726),),//Ricky：開頭背景
        home:  MyApp(),//Ricky：啟動開頭動畫

      ),

      )));*/
  SystemChrome.setPreferredOrientations([])
      .then((value) =>
      runApp(ProviderScope(
        child: MaterialApp(
          themeMode: ThemeMode.system,


          title: "Tiwee",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(textTheme: GoogleFonts.soraTextTheme(),
          scaffoldBackgroundColor: Color(0xff1a1726),),//Ricky：開頭背景
        home:  MyApp(),//Ricky：啟動開頭動畫

      ),

      )));
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
