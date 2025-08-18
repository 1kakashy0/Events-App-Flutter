/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:flutter/material.dart';

class CustomtextBodyAuth extends StatelessWidget {
  final String text;
  final String? textemail;
  final TextAlign? textAlign;
  const CustomtextBodyAuth({super.key, required this.text, required this.textAlign, this.textemail});

  @override
  Widget build(BuildContext context) {
    return
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: textAlign,
        );
  }
}