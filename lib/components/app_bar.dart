import 'package:flutter/material.dart';

class CustomAppBar extends AppBar implements PreferredSizeWidget {
  CustomAppBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar( title: Text("Sample App Bar") );
  }
}