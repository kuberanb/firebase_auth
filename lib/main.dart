import 'package:firebase_auth/provider/login/login_provider.dart';
import 'package:firebase_auth/provider/register/register_provider.dart';
import 'package:firebase_auth/utils/colors.dart';
import 'package:firebase_auth/views/login/login_screen.dart';
import 'package:firebase_auth/views/register/register_screen.dart';
import 'package:firebase_auth/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider<RegisterProvider>(
          create: (context) => RegisterProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Emcus',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            error: kMainColor,
          ),

          //  ColorScheme.fromSeed(
          //   seedColor: Colors.deepPurple,
          // ),

          useMaterial3: true,
        ),
        home: RegisterScreen(),
      ),
    );
  }
}
