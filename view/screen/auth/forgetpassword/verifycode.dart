/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/forgetpassword/verifycode_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
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
          child: Container(
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
                controller.goToResetPassword(verificationCode);
              }, // end onSubmit
            ),
          ],
        ),
      )),
    );
  }
}
