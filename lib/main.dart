import 'package:flutter/material.dart';
import 'package:otto_int/ApiService/ApiService.dart';
import 'package:otto_int/Screens/HomeScreen/HomeScreen.dart';
import 'package:otto_int/Screens/LoginScreen/LoginScreen.dart';
import 'package:get/get.dart';
import 'package:otto_int/Utils/Colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Otto International',
        theme: ThemeData(
          primaryColor: ottoPrimary,
        ),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => LoginScreen()),
          GetPage(name: '/home', page: () => HomeScreen()),
        ]);
  }
}
