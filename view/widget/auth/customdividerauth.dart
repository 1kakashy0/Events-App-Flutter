/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
                const Expanded(child: Divider(thickness: 0.5, color: Colors.grey, )),
                Text(" Or " , style: Theme.of(context).textTheme.bodyLarge),
                const Expanded(child: Divider(thickness: 0.5, color: Colors.grey, ))
                ],
            );
  }
}