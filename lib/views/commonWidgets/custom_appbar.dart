import 'package:firebase_auth/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kMainColor, // Set your desired background color
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), // Adjust the radius as needed
          bottomRight: Radius.circular(20), // Adjust the radius as needed
        ),
      ),
      child: SafeArea(
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20), // Same as above
              bottomRight: Radius.circular(20), // Same as above
            ),
          ),
          centerTitle: true,
          title: Image.asset(
            'assets/images/auth_appbar_logo.png', // Replace with your image path
            height: kToolbarHeight * 0.8, // Adjust image size as needed
          ),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: kWhiteColor,
            ),

            //  Stack(
            //   children: [
            //     Positioned(
            //       left: 5,
            //       child: Container(
            //         width: 20,
            //         height: 2,
            //         color: Colors.white,
            //       ),
            //     ),
            //     Container(
            //       width: 15,
            //       height: 2,
            //       color: Colors.white,
            //     ),
            //     Positioned(
            //       right: 5,
            //       child: Container(
            //         width: 10,
            //         height: 2,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
