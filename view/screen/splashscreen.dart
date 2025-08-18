/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'dart:async';

import 'package:event_project/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

import '../../core/constant/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/language");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Appcolor.bkcolor,
      body: Center(
        child: Container(
          // margin: EdgeInsets.all(250),
          child: Image.asset(Imageasset.logo)
        ),
      ),
    );
  }
}