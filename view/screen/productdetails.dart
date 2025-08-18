/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/productdetails_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/view/widget/productdetails/buybutton.dart';
import 'package:event_project/view/widget/productdetails/customdivider.dart';
import 'package:event_project/view/widget/productdetails/eventposition.dart';
import 'package:event_project/view/widget/productdetails/productabout.dart';
import 'package:event_project/view/widget/productdetails/productinformation.dart';
import 'package:event_project/view/widget/productdetails/producttoppage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
      ProductDetailsControllerImp controller =  Get.put(ProductDetailsControllerImp());
    return SafeArea(
        child: Scaffold(
            backgroundColor: Appcolor.bkcolor,
            bottomNavigationBar: BuyButton(
              text: 'Add To Cart',
              onPressed: () async{
                await controller.addEvents(controller.eventsModel.eventId.toString());
                Get.toNamed(AppRoute.cart);
                
              },
            ),
            body: ListView(children: [
              SizedBox(
                height: 250,
                child: ProductTopPage(eventsModel: controller.eventsModel,),
              ),
              SizedBox(
                height: 90,
              ),
              CustomDividerProduct(),
              ProductAbout(),
              CustomDividerProduct(),
              ProductInformation(),
              CustomDividerProduct(),
              EventPosition(),
              CustomDividerProduct(),
              InkWell(onTap :(){
                controller.goToFeedBack(controller.eventsModel);
                },
                child: const Text("feedbacks" , style: TextStyle(color: Colors.white ),textAlign:TextAlign.center,))
              // PriceAndCountEvents(
              //   onAdd: () {
              //     // controller.cartController
              //     //     .add(controller.eventsModel.eventId.toString());
              //   },
              //   onRemove: () {},
              //   price: "${controller.eventsModel.eventPrice}",
              //   count: "2",
              // ),
            ])));
  }
}
