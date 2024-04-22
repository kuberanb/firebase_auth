import 'package:emcus/views/auth/auth_screen.dart';
import 'package:emcus/views/bottomNavigation/custom_bottom_navigation_bar.dart';
import 'package:emcus/views/commonWidgets/show_snackbar.dart';
import 'package:emcus/views/login/login_screen.dart';
import 'package:emcus/views/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  // Radio Button
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  void setIsChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  Future signIn(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (userCredential.user != null) {
        showSnackBar(context, "Sign In Sucessfull");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => CustomBottomNavigationBar()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        showSnackBar(context, e.toString());
      }

      print(e);
    }
  }

  Future signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      showSnackBar(
        context,
        'Logout Sucessful',
      );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      print(e);
      showSnackBar(context, e.message.toString());
    }
  }
}
