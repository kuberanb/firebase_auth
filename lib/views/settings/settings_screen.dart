import 'package:firebase_auth/utils/colors.dart';
import 'package:firebase_auth/utils/constants.dart';
import 'package:firebase_auth/views/commonWidgets/custom_appbar.dart';
import 'package:firebase_auth/views/commonWidgets/custom_button.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: .85 * screenHeight,
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Settings",
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 25,
                  fontFamily: fontFamilName,
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(kMainColor)),
                onPressed: () {},
                child: const Text(
                  "LogOut",
                  style: TextStyle(color: kWhiteColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
