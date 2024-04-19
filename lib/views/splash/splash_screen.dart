import 'package:firebase_auth/utils/colors.dart';
import 'package:firebase_auth/views/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> gotoScreen(BuildContext context) async {
    print('Splash Screen Open');
    await Future.delayed(const Duration(milliseconds: 1500));
    print('Registration Screen Open');
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: ((context) => LoginScreen()),
      ),
    );
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
