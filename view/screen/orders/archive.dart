/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/orders/archive_controller.dart';
import 'package:event_project/core/class/handlingdataview.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/view/widget/orders/orderslistecardarchive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchiveView extends StatelessWidget {
  const OrdersArchiveView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
      backgroundColor: Appcolor.bkcolor,
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
                      'My orders',
                        style: TextStyle(fontSize: 25 , color: Appcolor.pink , fontWeight: FontWeight.bold
                        ),
                      ),
                    )),
                )  ,
        body: Container(
          padding:const  EdgeInsets.all(10),
          child: GetBuilder<OrdersArchiveController>(
              builder: ((controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) =>
                        CardOrdersListArchive(listdata: controller.data[index])),
                  )))),
        ));
  }
}