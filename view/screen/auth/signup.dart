/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/auth/signup_controller.dart';
import 'package:event_project/core/class/handlingdataview.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/functions/alertexitapp.dart';
import 'package:event_project/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customdividerauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/textsignupsignin.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => SignUpControllerImp());
    Get.put(SignUpControllerImp());
    return Scaffold(
        backgroundColor: Appcolor.bkcolor,
        body: SafeArea(
            child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => PopScope(
              canPop: false,
              onPopInvoked: alertExitApp,
              child: GetBuilder<SignUpControllerImp>(builder: (controller) =>
              HandlingDataRequest(statusRequest:  controller.statusRequest , widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      // const LogoAuth(),
                      const SizedBox(height: 60,),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextTitleAuth(
                        text: "19".tr,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      CustomtextBodyAuth(
                        text: "20".tr,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 25),
                      CustomTextFormAuth(
                        valid: (val) {
                          return (validInput(val!, 5, 100, 'username'));
                        },
                        isNumber: false,
                        mycontroller: controller.username,
                        hinttext: "21".tr,
                        labeltext: "22".tr,
                        icondata: Icons.person_2_outlined,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        valid: (val) {
                          return (validInput(val!, 5, 100, 'email'));
                        },
                        isNumber: false,
                        mycontroller: controller.email,
                        hinttext: "11".tr,
                        labeltext: "12".tr,
                        icondata: Icons.email_outlined,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        valid: (val) {
                          return (validInput(val!, 7, 30, 'password'));
                        },
                        isNumber: false,
                        mycontroller: controller.password,
                        hinttext: "13".tr,
                        labeltext: "14".tr,
                        icondata: Icons.lock_outline,
                        obscureText: true,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        valid: (val) {
                          return (validInput(val!, 7, 15, 'phone'));
                        },
                        isNumber: true,
                        mycontroller: controller.phone,
                        hinttext: "23".tr,
                        labeltext: "24".tr,
                        icondata: Icons.phone_android_outlined,
                      ),
                      const SizedBox(height: 15),
                      CustomButtonAuth(
                        text: "18".tr,
                        onPressed: () {
                          controller.signUp();
                        },
                      ),
                      const CustomDivider(),
                      const SizedBox(height: 10),
                      CustomtextSignUpORSignIn(
                        textone: "26".tr,
                        texttwo: "27".tr,
                        onTap: () {
                          controller.goToSignIn();
                        },
                      ),
                    ],
                  ),
                ),
              ),)),
        ))));
  }
}
