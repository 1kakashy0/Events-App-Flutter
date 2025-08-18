/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Appcolor.pink,
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 30),
      height: 50,
      child: MaterialButton(
        textColor: Colors.white,
        onPressed: onPressed,      //function fy onboarding controller fy dossier controller rbatneha bl GetView<OnBoardingConrollerImp>,
        child: Text(text),
      ),
      
    );
  }
}
