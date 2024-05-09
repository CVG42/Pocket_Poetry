import 'package:flutter/material.dart';
import 'package:zap653/examenp1.dart';
import 'package:zap653/fragments/dashboard_of_fragments.dart';
import 'package:zap653/login_screen.dart';
import 'package:zap653/tidal.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zap653/signup_screen.dart';
import 'package:zap653/userPreferences/user_preferences.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.lightBlue, fontFamily: 'monregular'),
      home: FutureBuilder(
        future: RememberUserPrefs.readUser(),
        builder: (context, dataSnapShot){
          if(dataSnapShot.data == null){
            return LoginScreen();
          }
          else{
            return DashboardOfFragments();
          }
        },
      ),
      //LoginScreen(),
      debugShowCheckedModeBanner: false,
      //SE NECESITA PARA EL SMART DIALOG
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init()
    );
  }
}
