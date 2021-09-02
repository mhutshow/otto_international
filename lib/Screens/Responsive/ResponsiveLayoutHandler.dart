import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  ResponsiveWidget({required this.mobile,  required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context , constrains){
      if(constrains.maxWidth<786){
        return mobile;
      } else {
        return desktop;
      }
    });
  }
}

