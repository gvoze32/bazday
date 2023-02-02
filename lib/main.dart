import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:bazday/pages/homepage.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
