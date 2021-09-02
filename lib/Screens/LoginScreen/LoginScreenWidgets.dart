import 'package:flutter/material.dart';
import 'package:otto_int/Utils/Colors.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreenInput extends StatelessWidget {
  LoginScreenInput({
    required this.email,
    required this.password,
    required this.onLoginPressed, required this.btnController,
  });

  final TextEditingController email;
  final TextEditingController password;
  final VoidCallback onLoginPressed;
  final RoundedLoadingButtonController btnController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoginInput(
            controller: email,
            icon: Icons.email,
            hint: 'Enter email or username',
          ),
          SizedBox(height : 20),
          LoginInput(
            controller: password,
            icon: Icons.lock,
            hint: 'Enter password',
          ),
          SizedBox(height : 30),
          RoundedLoadingButton(
            successColor: Colors.greenAccent,
            color: ottoPrimary,
            child: Text('LOG IN', style: TextStyle(color: Colors.white , fontSize: 18)),
            controller: btnController,
            onPressed: onLoginPressed,
          ),
          SizedBox(height: 20,),
          Center(child: Text('Or' , style: TextStyle(color: ottoPrimary, fontWeight: FontWeight.bold , fontSize: 18),)),
          Center(child: Text('Continue with' , style: TextStyle(color: ottoPrimary, fontWeight: FontWeight.bold , fontSize: 18),)),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialButton(
                assetName: 'google',
                onTap: (){
                  //TODO: Social Login
                },
              ),
              SizedBox(width: 10,),
              SocialButton(
                assetName: 'fb',
                onTap: (){
                  //TODO: Social Login
                },
              ),
              SizedBox(width: 10,),
              SocialButton(
                assetName: 'git',
                onTap: (){
                  //TODO: Social Login
                },
              ),
            ],
          ),

        ],
      ),
    );
  }
}

class LoginScreenHello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hello.' , style: TextStyle(fontSize: 80 , color: ottoPrimary),),
        Text('Welcome to Otto Int.' , style: TextStyle(fontSize: 30),),
        Image.asset(
          'Assets/Images/login_head.png',
        ),
      ],
    ),
    );
  }
}

class SocialButton extends StatelessWidget {
  SocialButton({required this.assetName, required this.onTap});
  final String assetName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60, width: 60,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ottoPrimary.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(4, 7), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Image.asset(
            'Assets/Images/$assetName.png',
          ),
        ),
      ),
    );
  }
}

class LoginInput extends StatelessWidget {
  LoginInput({required this.controller, required this.hint, required this.icon});

  final TextEditingController controller;
  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ottoPrimary.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(4, 7), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          isDense: true, // Added this
          contentPadding: EdgeInsets.all(10),
          enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: BorderSide( color:ottoSecondary.withOpacity(0.5) ,width: 1),
          ),
          focusedBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: BorderSide(
                color: ottoSecondary.withOpacity(0.2)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          disabledBorder: InputBorder.none,
          hintText: hint,
          //contentPadding: EdgeInsets.all(8),
          prefixIcon: Icon(
            icon,
            color: ottoPrimary,
          ),
        ),
      ),
    );
  }
}
