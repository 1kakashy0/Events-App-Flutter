/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/cart_controller.dart';
import 'package:event_project/core/class/handlingdataview.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/view/widget/cart/custom_bottom_navigationbar_cart.dart';
import 'package:event_project/view/widget/cart/customeventscartlist.dart';
import 'package:event_project/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
      backgroundColor: Appcolor.bkcolor,
      elevation: 5,
      leading:
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            Get.back() ;
                          }, icon: const Icon(Icons.arrow_back , color: Colors.white,)),
                    )),
                    title:  Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                      'Cart',
                        style: const TextStyle(fontSize: 25 , color: Appcolor.pink , fontWeight: FontWeight.bold
                        ),
                      ),
                    )),
                )  ,
          backgroundColor: Appcolor.bkcolor,
          bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => BottomNavgationBarCart(
                totalprice: "${cartController.priceorders} "),
          ),
          body: GetBuilder<CartController>(
              builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      const SizedBox(height: 15),
                      TopCardCart(
                          message:
                              "You Have ${cartController.totalcountevents} Events in Your List"),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ...List.generate(
                              cartController.data.length,
                              (index) => CustomEventsCartList(
                                onAdd: () async {
                                  await cartController
                                      .add(cartController.data[index].eventId.toString());
                                  cartController.refreshPage();
                                },
                                onRemove: () async  {
                                await cartController.delete(
                                      cartController.data[index].eventId.toString());
                                  cartController.refreshPage();
                                },
                                imageName:
                                    "${cartController.data[index].eventImage}",
                                name: "${cartController.data[index].eventName}",
                                price:
                                    "${cartController.data[index].eventsprice}",
                                // onPressed: () async {
                                //   await cartController.delete(cartController
                                //       .data[index].eventId.toString());
                                //   cartController.refreshPage();
                                // },
                                count:
                                "${cartController.data[index].countevents}"
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ))))),
    );
  }
}
