/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBarEvents extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged ;
  final bool active;
  final TextEditingController mycontroller;
  const CustomAppBarEvents(
      {super.key,
      required this.titleappbar,
      this.onPressedSearch,
      required this.active, this.onChanged, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                controller: mycontroller,
                onChanged: onChanged,
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: onPressedSearch,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'Search',
                      filled: true,
                      fillColor: Appcolor.searchcolor))),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
