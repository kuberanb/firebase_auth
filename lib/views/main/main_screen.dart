import 'package:emcus/utils/colors.dart';
import 'package:emcus/views/auth/auth_screen.dart';
import 'package:emcus/views/bottomNavigation/custom_bottom_navigation_bar.dart';
import 'package:emcus/views/commonWidgets/auth_app_bar.dart';
import 'package:emcus/views/commonWidgets/exit_dialog_box.dart';
import 'package:emcus/views/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }

        showExitDialog(context);
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: const AuthAppBar(),
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: kWhiteColor,
                  strokeWidth: 2,
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Something went Wrong',
                  style: TextStyle(
                    color: kMainColor,
                    fontSize: 20,
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              return CustomBottomNavigationBar();
            } else {
              return AuthPage();
            }
          }),
        ),
      ),
    );
  }
}
