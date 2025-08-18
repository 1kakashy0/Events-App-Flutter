/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomtextSignUpORSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  const CustomtextSignUpORSignIn(
      {super.key,
      required this.texttwo,
      required this.textone,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textone,
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 3,
        ),
        InkWell(
            onTap: onTap,
            child: Text(
              texttwo,
              style: const TextStyle(color: Appcolor.pink),
            ))
      ],
    );
  }
}
