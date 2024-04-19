import 'package:firebase_auth/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final double? height;
  final double width;
  final bool isObscure;
  final TextInputType keyboardType;
  final String? Function(String?)? validatorFunction;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
     this.height,
    required this.width,
    required this.isObscure,
    required this.validatorFunction,
    this.keyboardType = TextInputType.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     height: height,
      width: width,
      child: TextFormField(
        obscureText: isObscure,
        controller: controller,
        // minLines: 0,
        maxLines: 1,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          hintMaxLines: 1,
          // isDense: true,
          fillColor: Colors.transparent,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: ktextFormFieldHintColor,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: ktextFormFieldBorderColor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: ktextFormFieldBorderColor,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: ktextFormFieldBorderColor,
              width: 1.0,
            ),
          ),
        ),
        validator: validatorFunction,
      ),
    );
  }
}
