/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:flutter/material.dart';

class CustomDividerProduct extends StatelessWidget {
  const CustomDividerProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: const Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ));
  }
}