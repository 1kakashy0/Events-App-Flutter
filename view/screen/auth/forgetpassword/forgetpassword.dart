/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/class/handlingdataview.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/functions/validinput.dart';
import 'package:event_project/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/forgetpassword_controller.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Appcolor.bkcolor,
      appBar: AppBar(
        backgroundColor: Appcolor.bkcolor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading:  IconButton(onPressed: () { Get.back(); }, icon: const  Icon(Icons.arrow_back_ios) ,),
      ),
      body: SafeArea(
          child: GetBuilder<ForgetPasswordControllerImp>(builder: ((controller) =>
          HandlingDataRequest(statusRequest:  controller.statusRequest , widget: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              CustomTextTitleAuth(
                text: "15".tr,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              CustomtextBodyAuth(
                text: "28".tr,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 25),
              CustomTextFormAuth(
                valid: (val){
                  return (validInput(val!, 5, 100, 'email'));
                } ,
                isNumber: false,
                mycontroller: controller.email,
                hinttext: "11".tr,
                labeltext: "12".tr,
                icondata: Icons.email_outlined,
              ),
              const SizedBox(height: 30),
              CustomButtonAuth(
                  text: "29".tr,
                  onPressed: () {
                    controller.checkemail();
                  }),
            ],
          ),
        ),
      ))),
    )));
  }
}
