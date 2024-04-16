import 'package:firebase_auth/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
