/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icondata;
  final bool active ;
    const CustomBottomAppBar({super.key, this.onPressed, required this.icondata,  required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icondata,
            color: active == true ? Appcolor.pink : Colors.white  ,
          ),
        ],
      ),
    );
  }
}
