import 'package:emcus/utils/colors.dart';
import 'package:emcus/views/auth/auth_screen.dart';
import 'package:emcus/views/bottomNavigation/custom_bottom_navigation_bar.dart';
import 'package:emcus/views/login/login_screen.dart';
import 'package:emcus/views/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> gotoScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // If the user is logged in, navigate to HomeScreen

      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) => CustomBottomNavigationBar(),
      //   ),
      // );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => CustomBottomNavigationBar()),
          (route) => false);
    } else {
      // If the user is not logged in, navigate to LoginScreen

      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) => LoginScreen(),
      //   ),
      // );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    }
  }

  @override
  void initState() {
    gotoScreen(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Container(
              width: screenWidth,
              child: Row(
                children: [
                  Container(
                    height: screenHeight,
                    width: .35 * screenWidth,
                    decoration: const BoxDecoration(
                      gradient: splashLinearGradient,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: .2 * screenHeight),
                      height: screenHeight,
                      decoration: const BoxDecoration(
                        color: kBackgroundColor,
                      ),
                      child: Center(
                        child: Container(
                          child: Image.asset("assets/images/splash_logo_1.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Image.asset("assets/images/splash_camera_1.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
