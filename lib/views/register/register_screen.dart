import 'package:emcus/provider/register/register_provider.dart';
import 'package:emcus/utils/colors.dart';
import 'package:emcus/utils/constants.dart';
import 'package:emcus/views/commonWidgets/auth_app_bar.dart';
import 'package:emcus/views/commonWidgets/custom_button.dart';
import 'package:emcus/views/commonWidgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final registerProvider = Provider.of<RegisterProvider>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AuthAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: .9 * screenWidth,
                height: .85 * screenHeight,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    children: [
                      kHeight20,
                      const RegisterText(),
                      kHeight5,
                      const Row(
                        children: [
                          TextFormFieldHeader(headingText: "Name"),
                          kHeight5,
                        ],
                      ),
                      kHeight5,
                      CustomTextFormField(
                        hintText: "Enter your name",
                        controller: registerProvider.nameController,
                        //  height: 42,
                        width: .8 * screenWidth,
                        isObscure: true,
                        validatorFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return "name cannot be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      kHeight10,
                      const Row(
                        children: [
                          TextFormFieldHeader(headingText: "Company Name"),
                          kHeight5,
                        ],
                      ),
                      kHeight5,
                      CustomTextFormField(
                        hintText: "Enter your company name",
                        controller: registerProvider.companyNameController,
                        //  height: 42,
                        width: .8 * screenWidth,
                        isObscure: true,
                        validatorFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return "company name cannot be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      kHeight10,
                      const Row(
                        children: [
                          TextFormFieldHeader(headingText: "Email Address"),
                          kHeight5,
                        ],
                      ),
                      kHeight5,
                      CustomTextFormField(
                        hintText: "Enter your email address",
                        controller: registerProvider.emailController,
                        // height: 42,
                        width: .8 * screenWidth,
                        isObscure: true,
                        validatorFunction: (value) {
                          final emailRegex =
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (value == null || value.isEmpty) {
                            return "enter email address";
                          } else if (!emailRegex.hasMatch(value)) {
                            return "enter a valid email address";
                          } else {
                            return null;
                          }
                        },
                      ),
                      kHeight10,
                      const Row(
                        children: [
                          TextFormFieldHeader(headingText: "Password"),
                          kHeight5,
                        ],
                      ),
                      kHeight5,
                      CustomTextFormField(
                        hintText: "Enter your password",
                        controller: registerProvider.passwordController,
                        //   height: 42,
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
                      kHeight10,
                      const Row(
                        children: [
                          TextFormFieldHeader(headingText: "Confirm Password"),
                          kHeight5,
                        ],
                      ),
                      kHeight5,
                      CustomTextFormField(
                        hintText: "Enter your password",
                        controller: registerProvider.confirmPasswordController,
                        //    height: 42,
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
                      kHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SignUpRadioButton(),
                          kWidth5,
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "By signing up you are agreeing with the ",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "FFE ",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    "Terms & Conditions ",
                                    style: TextStyle(
                                      color: kMainColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "and ",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Privacy Policy",
                                    style: TextStyle(
                                      color: kMainColor,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      kHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                              buttonColor: kSignInButtonBackgroundColor,
                              textColor: ktextFormFieldHeadingColor,
                              height: 55,
                              width: .35 * screenWidth,
                              buttonText: "Cancel",
                              onClickFunction: () {}),
                          CustomButton(
                              height: 55,
                              width: .35 * screenWidth,
                              buttonText: "Register",
                              onClickFunction: () {}),
                        ],
                      ),
                      kHeight10,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have account? ",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Sign in here",
                            style: TextStyle(
                              color: kMainColor,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
        // fontWeight: FontWeight.bold,
      ),
    );
  }
}

class RegisterText extends StatelessWidget {
  const RegisterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Register",
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

class SignUpRadioButton extends StatefulWidget {
  @override
  _SignUpRadioButtonState createState() => _SignUpRadioButtonState();
}

class _SignUpRadioButtonState extends State<SignUpRadioButton> {
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
        width: 20.0,
        height: 20.0,
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
