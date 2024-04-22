import 'package:emcus/views/commonWidgets/show_snackbar.dart';
import 'package:emcus/views/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  // Radio Button
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  void setIsChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  Future signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (user.user != null) {
        showSnackBar(context, "user registered sucessfully");

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'The account already exists for that email.');
        print('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        showSnackBar(context, 'The email address is invalid.');
        return 'The email address is invalid.';
      } else if (e.code == 'operation-not-allowed') {
        showSnackBar(context, 'Error during sign up. Please try again later.');
        print('Error during sign up. Please try again later.');
      } else {
        showSnackBar(context, 'SignUp failed. Please try again later.');
        print('SignUp failed. Please try again later.');
      }
    }
  }
}
