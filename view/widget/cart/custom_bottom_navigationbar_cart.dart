/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************


// ignore_for_file: prefer_const_constructors

import 'package:event_project/controller/cart_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/view/widget/cart/buttoncart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  // final String price ; 
  // final String shipping ; 
  final String totalprice ; 
  const BottomNavgationBarCart({super.key,  required this.totalprice});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Container(
        //         padding: EdgeInsets.symmetric(horizontal: 20),
        //         child: Text("price", style: TextStyle(fontSize: 16 , color: Colors.white))),
        //     Container(
        //         padding: EdgeInsets.symmetric(horizontal: 20),
        //         child: Text("$price \$", style: TextStyle(fontSize: 16 , color: Colors.white)))
        //   ],
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Container(
        //         padding: EdgeInsets.symmetric(horizontal: 20),
        //         child: Text("", style: TextStyle(fontSize: 16 , color: Colors.white))),
        //     Container(
        //         padding: EdgeInsets.symmetric(horizontal: 20),
        //         child: Text("$shipping \$", style: TextStyle(fontSize: 16 , color: Colors.white)))
        //   ],
        // ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Total Price",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.pink))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$totalprice \TND",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.pink)))
          ],
        ),
        SizedBox(height: 10),
        CustomButtonCart(
          textbutton: "Buy Tickets",
          onPressed: () {
            controller.goToPageCheckout();
          },
        )
      ],
    ));
  }
}
