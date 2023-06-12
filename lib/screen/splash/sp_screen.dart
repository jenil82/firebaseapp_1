import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utills/fire_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  bool isLogin = false;

  void initState() {
    super.initState();
    isLogin = FbHelper.fbHelper.checkUser();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
          () => isLogin == true
          ? Get.offAndToNamed('home_screen')
          : Get.offAndToNamed('signin_screen'),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Admin Only !",
                  style: GoogleFonts.secularOne(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag,
                    color: Colors.black,
                    size: 160,
                  ),
                  Text(
                    "Shopping City",
                    style: GoogleFonts.secularOne(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}