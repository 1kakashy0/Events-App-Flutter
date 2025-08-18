/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/orders/details_controller.dart';
import 'package:event_project/core/class/handlingdataview.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/view/widget/orders/ordersdetailslist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      backgroundColor: Appcolor.bkcolor,
      appBar: AppBar(
        backgroundColor: Appcolor.bkcolor,
        elevation: 5,
        leading:
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        
        title:Container(
          alignment: Alignment.center,
          child: const Text(
            'My tickets',
            style: TextStyle(
                fontSize: 25,
                color: Appcolor.pink,
                fontWeight: FontWeight.bold),
          ),
        )
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GetBuilder<OrdersDetailsController>(
                builder: ((controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget:  SizedBox(
                      height: 690,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.data.length,
                          itemBuilder: ((context, index) =>
                              CardOrdersDetailsList(listdata: controller.data[index])),
                        ),
                    ),
                    )))),
          
          // const Divider(),
        ],
      ),
    );
  }
}
