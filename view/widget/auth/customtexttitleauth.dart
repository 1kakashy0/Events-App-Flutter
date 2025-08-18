/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text ;
  final TextAlign? textAlign ;
  const CustomTextTitleAuth({super.key, required this.text, required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
              text,
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: textAlign,
            );
  }
}