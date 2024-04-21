import 'package:emcus/provider/register/register_provider.dart';
import 'package:emcus/utils/colors.dart';
import 'package:emcus/utils/constants.dart';
import 'package:emcus/views/commonWidgets/custom_button.dart';
import 'package:emcus/views/commonWidgets/custom_text_form_field.dart';
import 'package:emcus/views/commonWidgets/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final VoidCallback toggle;
  const RegisterScreen({
    super.key,
    required this.toggle,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final registerProvider = Provider.of<RegisterProvider>(context,listen: false);
    return SingleChildScrollView(
      child: SizedBox(
        width: screenWidth,
        child: Form(
          key: registerProvider.formKey,
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
                            onClickFunction: () {
                              toggle();
                              // Navigator.of(context).pushAndRemoveUntil(
                              //     MaterialPageRoute(
                              //         builder: (context) => AuthScreen()),
                              //     (route) => false);
                            },
                          ),
                          CustomButton(
                            height: 55,
                            width: .35 * screenWidth,
                            buttonText: "Register",
                            onClickFunction: () async {
                              if (registerProvider.formKey.currentState!
                                  .validate()) {
                                if (registerProvider.isChecked) {
                                  if (registerProvider.passwordController.text
                                          .trim() ==
                                      registerProvider
                                          .confirmPasswordController.text
                                          .trim()) {
                                    await registerProvider.signUp(
                                        email: registerProvider
                                            .emailController.text
                                            .trim(),
                                        password: registerProvider
                                            .passwordController.text
                                            .trim(),
                                        context: context);
                                  } else {
                                    showSnackBar(context,
                                        "confirm password is not same as password");
                                  }
                                } else {
                                  showSnackBar(
                                      context, "select remember me checkbox ");
                                }
                              }
                            },
                          ),
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

    // Scaffold(
    //   backgroundColor: kBackgroundColor,
    //   appBar: const AuthAppBar(),

    // );
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
    final registerProvider = Provider.of<RegisterProvider>(context);
    return Checkbox(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      checkColor: ktextFormFieldBorderColor,
      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return kWhiteColor;
        }
        return kWhiteColor; // Use default color
      }),
      side: MaterialStateBorderSide.resolveWith(
        (states) =>
            const BorderSide(width: 1.0, color: ktextFormFieldBorderColor),
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: ktextFormFieldBorderColor, // Change the border color here
        ),
        borderRadius:
            BorderRadius.circular(2), // Adjust border radius as needed
      ),
      value: registerProvider.isChecked,
      onChanged: (value) {
        if (value != null) {
          registerProvider.setIsChecked(value);
        }
      },
    );
  }
}
