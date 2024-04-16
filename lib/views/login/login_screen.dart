import 'package:firebase_auth/provider/login/login_provider.dart';
import 'package:firebase_auth/utils/colors.dart';
import 'package:firebase_auth/utils/constants.dart';
import 'package:firebase_auth/views/common_widgets/auth_app_bar.dart';
import 'package:firebase_auth/views/common_widgets/custom_button.dart';
import 'package:firebase_auth/views/common_widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AuthAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                width: .9 * screenWidth,
                height: .48 * screenHeight,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(height: .03 * screenHeight),
                    SignInText(),
                    kHeight10,
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Container(
                        child: Form(
                          key: loginProvider.formKey,
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  TextFormFieldHeader(
                                      headingText: "Email Address"),
                                ],
                              ),
                              kHeight5,
                              CustomTextFormField(
                                hintText: "Enter your email address",
                                controller: emailController,
                                height: 42,
                                width: .8 * screenWidth,
                                isObscure: false,
                                validatorFunction: (value) {
                                  final emailRegex = RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                  if (value == null || value.isEmpty) {
                                    return "enter email address";
                                  } else if (!emailRegex.hasMatch(value)) {
                                    return "enter a valid email address";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              kHeight5,
                              const Row(
                                children: [
                                  TextFormFieldHeader(headingText: "Password"),
                                ],
                              ),
                              kHeight5,
                              CustomTextFormField(
                                hintText: "Enter your password",
                                controller: emailController,
                                height: 42,
                                width: .8 * screenWidth,
                                isObscure: true,
                                validatorFunction: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "password cannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              kHeight5,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RememberMeRadioButton(),
                                  kWidth5,
                                  const Text(
                                    "Remember Me",
                                    style: TextStyle(
                                      fontFamily: fontFamilName,
                                      color: ktextFormFieldHeadingColor,
                                    ),
                                  )
                                ],
                              ),
                              kHeight5,
                              ForgotPasswordText(),
                              kHeight5,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                      height: 60,
                                      width: .4 * screenWidth,
                                      buttonText: "Sign In",
                                      onClickFunction: () {}),
                                ],
                              ),
                              kHeight5,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    '''Don't have an account? ''',
                                    style: TextStyle(
                                      color: ktextFormFieldHeadingColor,
                                      fontFamily: fontFamilName,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      "Sign up here",
                                      style: TextStyle(
                                        color: kMainColor,
                                        fontFamily: fontFamilName,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              kHeight5,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              kHeight120,
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Forgot Password?",
          style: TextStyle(
            color: kMainColor,
            fontFamily: fontFamilName,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}

class SignInText extends StatelessWidget {
  const SignInText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
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
    );
  }
}

class TextFormFieldHeader extends StatelessWidget {
  final String headingText;
  const TextFormFieldHeader({super.key, required this.headingText});

  @override
  Widget build(BuildContext context) {
    return Text(
      //  "Email Address"
      headingText,
      style: const TextStyle(
        fontSize: 16,
        color: ktextFormFieldHeadingColor,
        fontFamily: fontFamilName,
      ),
    );
  }
}

class RememberMeRadioButton extends StatefulWidget {
  @override
  _RememberMeRadioButtonState createState() => _RememberMeRadioButtonState();
}

class _RememberMeRadioButtonState extends State<RememberMeRadioButton> {
  @override
  Widget build(BuildContext context) {
    // final loginProvider = Provider.of<LoginPr>(context);
    return InkWell(
      onTap: () {
        // setState(() {
        //   _isChecked = !_isChecked;
        // });
      },
      child: Container(
        width: 15.0,
        height: 15.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          border: Border.all(
            color: ktextFormFieldBorderColor,
            width: 1.0,
          ),
          color: Colors.transparent,
        ),
        child: const Icon(
          Icons.check,
          size: 16.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
