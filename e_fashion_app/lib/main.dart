import 'package:e_fashion_app/screens/home.dart';
import 'package:e_fashion_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'main_wrapper.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: AppTheme.appTheme,
    home: MainWrapper(),
  ));
}