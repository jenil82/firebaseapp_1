import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseapp_1/screen/home/view/Screen.dart';
import 'package:firebaseapp_1/screen/insert/insert_Screen.dart';
import 'package:firebaseapp_1/screen/signin/signin_Screen.dart';
import 'package:firebaseapp_1/screen/splash/sp_screen.dart';
import 'package:firebaseapp_1/screen/updete/updeate_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
            name: '/',
            page: () => SplashScreen(),
          ),
          GetPage(
            name: '/signin_screen',
            page: () => SigninScreen(),
          ),
          GetPage(
            name: '/home_screen',
            page: () => HomeScreen(),
          ),
          GetPage(
            name: '/insert_screen',
            page: () => InsertScreen(),
          ),
          GetPage(
            name: '/update_screen',
            page: () => UpdateScreen(),
          ),
        ],
      ),
    ),
  );
}