/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/forgetpassword/successresetpassword_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/view/widget/auth/custombuttonauth.dart';
import 'package:event_project/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Appcolor.bkcolor,
      appBar: AppBar(
        backgroundColor: Appcolor.bkcolor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading:  IconButton(onPressed: () { Get.back(); }, icon: const  Icon(Icons.arrow_back_ios) ,),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(child: Icon(Icons.check_circle_outline , size: 200, color: Appcolor.pink,)) ,
            CustomTextTitleAuth(
              text: "42".tr,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(text:"43".tr , onPressed: () {
                controller.goToPageLogin();
              },),
            ),
          ],
      
        ),
      ),
    );
  }
}