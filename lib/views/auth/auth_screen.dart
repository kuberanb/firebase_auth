import 'package:emcus/views/login/login_screen.dart';
import 'package:emcus/views/register/register_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginScreen(toggle: toggle)
        : RegisterScreen(toggle: toggle);
  }

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
