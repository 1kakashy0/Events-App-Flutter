/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:get/get.dart';

validInput(String val ,int min ,int max,String type){

if (type == "username") {
  if (!GetUtils.isUsername(val)){
    return 'Not Valid Username';
  }
}


if (type == "email") {
  if(val.isEmpty) {
    return "Values Can't be Empty";
  }else if (!GetUtils.isEmail(val)){
    return 'Not valid Email Address';
  }
}

if (type == "phone") {
  if (!GetUtils.isPhoneNumber(val)){
    return 'Not Valid Phone Number';
  }
}

if(val.isEmpty) {
  return "Values Can't be Empty";
}

if(val.length < min) {
  return "Values Can't be Less Than $min";
}

if(val.length > max) {
  return "Values Can't be Larger Than $max";
}
}