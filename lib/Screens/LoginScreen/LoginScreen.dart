import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otto_int/ApiService/ApiService.dart';
import 'package:otto_int/Screens/HomeScreen/HomeScreen.dart';
import 'package:otto_int/Screens/LoginScreen/LoginScreenWidgets.dart';
import 'package:otto_int/Screens/Responsive/ResponsiveLayoutHandler.dart';
import 'package:otto_int/Utils/Colors.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  void loginController() async {
    bool authSuccess= await ApiService.authentication(email.text, password.text);
    if(authSuccess==true){
      btnController.success();
      //It will stay in the screen for 1 sec to that the user sees the confirmation animation
      Timer(Duration(seconds: 1), () {
       Get.to(HomeScreen());
      });
    }else{
      btnController.error();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldcolor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ResponsiveWidget(
            desktop: Row(
              children: [
                LoginScreenHello(),
                LoginScreenInput(
                  email: email,
                  password: password,
                  onLoginPressed: () async {
                    loginController();
                  },
                  btnController: btnController,
                ),
              ],
            ),
            mobile: Column(
              children: [
                LoginScreenHello(),
                LoginScreenInput(
                  email: email,
                  password: password,
                  btnController: btnController,
                  onLoginPressed: () {
                    loginController();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
