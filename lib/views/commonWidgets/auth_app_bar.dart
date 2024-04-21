import 'package:emcus/utils/colors.dart';
import 'package:flutter/material.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor, // Set your desired background color
      child: SafeArea(
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Image.asset(
            'assets/images/auth_appbar_logo.png', // Replace with your image path
            height: kToolbarHeight * 0.8, // Adjust image size as needed
          ),
        ),
      ),
    );
  }
}
