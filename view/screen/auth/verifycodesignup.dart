/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/auth/verifycodesignup_controller.dart';
import 'package:event_project/core/class/handlingdataview.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtexttitleauth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
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
          child:
          GetBuilder<VerifyCodeSignUpControllerImp>(builder: (controller) =>
          HandlingDataRequest(statusRequest:  controller.statusRequest , widget: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            CustomTextTitleAuth(
              text: "30".tr,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            CustomtextBodyAuth(
              text: "31".tr,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 25),
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controller.goToSuccessSignUp(verificationCode);
              }, // end onSubmit
            ),
            const SizedBox(height : 25) ,
            InkWell(onTap: (){
                    controller.reSend() ;
                  },child: const Center(child: Text("Resend verfiy code" , style: TextStyle(color: Appcolor.pink , fontSize: 20 ),)),)
          ],
        ),
      ),)),
    ));
  }
}
