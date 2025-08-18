/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/orders/archive_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;

  const CardOrdersListArchive({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!),
                  Text(
                    Jiffy.parse(listdata.ordersDatetime!).fromNow(),
                    style: const TextStyle(
                        color: Appcolor.pink,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              // Text(
                  // "Order Type : ${controller.printOrderType(listdata.ordersType!)}"),
              Text("Order Price : ${listdata.ordersPrice} \$"),
              // Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),
              // Text(
                  // "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod.toString())} "),
              // Text(
              //     "Order Status : ${controller.printOrderStatus(listdata.ordersStatus.toString())} "),
                  const Text(
                  "Order Status : Successfully"),
              const Divider(),
              Row(
                children: [
                  Text("Total Price : ${listdata.ordersTotalprice} \$ ",
                      style: const TextStyle(
                          color: Appcolor.pink,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersDetails,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: Appcolor.circle,
                    textColor: Appcolor.circle,
                    child: const Text("Details" , style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
      ],
          )),
    );
  }
}