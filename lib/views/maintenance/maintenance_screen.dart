import 'package:firebase_auth/utils/colors.dart';
import 'package:firebase_auth/utils/constants.dart';
import 'package:firebase_auth/views/commonWidgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

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
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Maintenance",
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 25,
                  fontFamily: fontFamilName,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
