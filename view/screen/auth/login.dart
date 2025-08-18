/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/auth/login_controller.dart';
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

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: Appcolor.bkcolor,
      body: SafeArea(
          child: PopScope(
        canPop: false,
        onPopInvoked: alertExitApp,
        child: GetBuilder<LoginControllerImp>(builder: (controller) => 
        HandlingDataRequest(statusRequest:  controller.statusRequest , widget:  Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                const SizedBox(
                  height: 40,
                ),
                // const LogoAuth(),
                const SizedBox(height: 100,),
                // const SizedBox(
                //   height: 20,
                // ),
                CustomTextTitleAuth(
                  text: "9".tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                CustomtextBodyAuth(
                  text: "10".tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                CustomTextFormAuth(
                  valid: (val) {
                    return (validInput(val!, 5, 100, 'email'));
                  },
                  isNumber: false,
                  mycontroller: controller.email,
                  hinttext: "12".tr,
                  labeltext: "12".tr,
                  icondata: Icons.email_outlined,
                ),
                const SizedBox(height: 20),
                GetBuilder<LoginControllerImp>(
                  builder: (controller) => CustomTextFormAuth(
                    obscureText: controller.isshowpassword,
                    onTapIcon: () {
                      controller.showPassword();
                      
                    },
                    valid: (val) {
                      return (validInput(val!, 8, 30, 'password'));
                    },
                    isNumber: false,
                    mycontroller: controller.password,
                    hinttext: "14".tr,
                    labeltext: "14".tr,
                    icondata: Icons.lock_outline,
                    showPasswordIconOne:Icons.visibility ,
                    showPasswordIconTwo:Icons.visibility_off_outlined ,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 150),
                  child: InkWell(
                    onTap: () {
                      controller.goTpForgetPassword();
                    },
                    child: Text("15".tr,
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonAuth(
                  text: "16".tr,
                  onPressed: () {
                    controller.login();
                  },
                ),
                const CustomDivider(),
                const SizedBox(height: 20),
                CustomtextSignUpORSignIn(
                    textone: "17".tr,
                    texttwo: "18".tr,
                    onTap: () {
                      controller.goToSignUp();
                    })
              ],
            ),
          ),
        ),)
      )),
    ));
  }
}
