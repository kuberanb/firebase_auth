import 'package:emcus/provider/login/login_provider.dart';
import 'package:emcus/utils/colors.dart';
import 'package:emcus/utils/constants.dart';
import 'package:emcus/views/commonWidgets/custom_button.dart';
import 'package:emcus/views/commonWidgets/custom_text_form_field.dart';
import 'package:emcus/views/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  VoidCallback toggle;
  LoginScreen({
    super.key,
    required this.toggle,
  });

  // TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return SingleChildScrollView(
      child: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              width: .9 * screenWidth,
              height: .6 * screenHeight,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: .01 * screenHeight),
                  const SignInText(),
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
                              controller: loginProvider.emailController,
                              //  height: 42,
                              width: .8 * screenWidth,
                              isObscure: false,
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
                            kHeight5,
                            const Row(
                              children: [
                                TextFormFieldHeader(headingText: "Password"),
                              ],
                            ),
                            kHeight5,
                            CustomTextFormField(
                              hintText: "Enter your password",
                              controller: loginProvider.passwordController,
                              //  height: 42,
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
                                  onClickFunction: () async {
                                    if (loginProvider.formKey.currentState!
                                        .validate()) {
                                      await loginProvider.signIn(context);
                                    }

                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             CustomBottomNavigationBar()));
                                  },
                                ),
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
                                  onTap: () {
                                    toggle();
                                  },
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
    );

    // Scaffold(
    //   backgroundColor: kBackgroundColor,
    //   appBar: AuthAppBar(),

    // );
  }
}

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
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
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Checkbox(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      checkColor: ktextFormFieldBorderColor,
      fillColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return kWhiteColor;
          }
          return kWhiteColor; // Use default color
        },
      ),
      side: MaterialStateBorderSide.resolveWith(
        (states) => const BorderSide(
          width: 1.0,
          color: ktextFormFieldBorderColor,
        ),
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: ktextFormFieldBorderColor, // Change the border color here
        ),
        borderRadius:
            BorderRadius.circular(2), // Adjust border radius as needed
      ),
      value: loginProvider.isChecked,
      onChanged: (value) {
        if (value != null) {
          loginProvider.setIsChecked(value);
        }
      },
    );
  }
}
