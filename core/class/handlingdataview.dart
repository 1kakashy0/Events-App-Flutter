/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************


import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ?   Center(child: Lottie.asset(Imageasset.loading , width: 105 , height: 105))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Lottie.asset(Imageasset.offline , width: 300 , height: 300))
            : statusRequest == StatusRequest.serverfailure
                ?Center(child: Lottie.asset(Imageasset.serverfail , width: 300 , height: 300))
                : statusRequest == StatusRequest.failure
                    ? Center(child: Lottie.asset(Imageasset.nodata , width: 300 , height: 300 , repeat: true  ))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ?   Center(child: Lottie.asset(Imageasset.loading , width: 105 , height: 105))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Lottie.asset(Imageasset.offline , width: 105 , height: 105))
            : statusRequest == StatusRequest.serverfailure
                ?Center(child: Lottie.asset(Imageasset.serverfail , width: 300 , height: 300))
                
                    : widget;
  }
}