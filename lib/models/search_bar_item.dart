import 'package:flutter/material.dart';

class SearchBarItem {
  final IconData icon;
  final String text;
  final String category;
  final Function onTap;
  late final int priority;

  SearchBarItem(
      {required this.icon,
      required this.text,
      required this.category,
      required this.onTap}) {
    priority = 1;
  }
}
