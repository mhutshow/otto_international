import 'package:flutter/material.dart';
import 'package:otto_int/ApiService/ApiService.dart';
import 'package:otto_int/Screens/HomeScreen/HomeScreen.dart';
import 'package:otto_int/Screens/LoginScreen/LoginScreen.dart';
import 'package:get/get.dart';
import 'package:otto_int/Utils/Colors.dart';
import 'package:wordpress_api/wordpress_api.dart';

import 'ApiService/FetchPosts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Otto International',
        theme: ThemeData(
          primaryColor: ottoPrimary,
        ),
        initialRoute: '/home',
        getPages: [
          GetPage(name: '/', page: () => LoginScreen()),
          GetPage(name: '/home', page: () => HomeScreen()),
        ]);
  }
}
