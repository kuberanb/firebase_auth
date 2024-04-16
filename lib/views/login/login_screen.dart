import 'package:firebase_auth/utils/colors.dart';
import 'package:firebase_auth/utils/constants.dart';
import 'package:firebase_auth/views/common_widgets/auth_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AuthAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: .9 * screenWidth,
              height: .5 * screenHeight,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign In",
                        style: TextStyle(
                          fontFamily: "Humanst",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  kHeight10,
                  

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
