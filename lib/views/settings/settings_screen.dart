import 'package:emcus/provider/login/login_provider.dart';
import 'package:emcus/utils/colors.dart';
import 'package:emcus/utils/constants.dart';
import 'package:emcus/views/commonWidgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final loginProvider = Provider.of<LoginProvider>(context);
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
                onPressed: () async {
                  await loginProvider.signOut(context);
                },
                child: const Text(
                  "LogOut",
                  style: TextStyle(color: kWhiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
