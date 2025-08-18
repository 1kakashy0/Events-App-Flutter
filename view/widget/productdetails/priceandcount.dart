/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/constant/colors.dart';
import 'package:flutter/material.dart';

class PriceAndCountEvents extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final String count;
  const PriceAndCountEvents(
      {super.key,
      required this.onAdd,
      required this.onRemove,
      required this.price,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Row(
            children: [
              IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 2),
                  width: 50,
                  // height: 30,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: Text(
                    count,
                    style: const TextStyle(fontSize: 20, height: 1.1 , color: Colors.white ),
                  )),
              IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
            ],
          ),
          const SizedBox(width: 100,),
          Text(
            "$price \TND",
            style: const TextStyle(
                color: Appcolor.pink, fontSize: 30, height: 1.1),
          )
        ],
    );
  }
}