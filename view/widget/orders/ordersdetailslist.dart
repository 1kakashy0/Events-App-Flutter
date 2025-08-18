/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/orders/details_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/data/model/orderdetailsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CardOrdersDetailsList extends GetView<OrdersDetailsController> {
  final OrdersDetailsModel listdata;

  const CardOrdersDetailsList({super.key, required this.listdata});

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
                  Text("Ticket Number : #${listdata.cartId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text("${listdata.eventsprice} TND" , style: const TextStyle(
                        color: Appcolor.pink, fontWeight: FontWeight.bold),),
                  // Text(
                  //   Jiffy.parse(listdata.ordersDatetime!).fromNow(),
                  //   style: const TextStyle(
                  //       color: Appcolor.pink, fontWeight: FontWeight.bold),
                  // )
                ],
              ),
              const Divider(),
              Text("Event Name : ${listdata.eventName}"),
              Text("Event Date : ${listdata.eventDate} "),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Event Location : ${listdata.eventLocation} ",
                      style: const TextStyle(
                          color: Appcolor.pink, fontWeight: FontWeight.bold)),
                  // const Spacer(),
                  // MaterialButton(
                  //   onPressed: () {
                  //     Get.toNamed(AppRoute.ordersDetails,
                  //         arguments: {"ordersmodel": listdata});
                  //   },
                  //   color: Appcolor.circle,
                  //   textColor: Appcolor.circle,
                  //   child: const Text("Details" , style: TextStyle(color: Colors.white),),
                  // ),
                ],
              ),
              const Divider(),
              Center(
                child: QrImageView(
                  data:
                      'Event Name: ${listdata.eventName}, Event Date: ${listdata.eventDate}, Event Location: ${listdata.eventLocation} , Ticket ID: ${listdata.cartId}',
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
            ],
          )),
    );
  }
}
