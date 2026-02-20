/* 

  LOGIN PAGE UI

  On this page a user can log in with their:
  - email
  - pw

  ========================================================
  Once the user successfully logs in, they will be directed to the homepage

  if user doesn't have an account they can go to register page to create one.

 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
    );
  }
}