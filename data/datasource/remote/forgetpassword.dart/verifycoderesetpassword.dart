/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************


import 'package:event_project/core/class/crud.dart';
import 'package:event_project/linkapi.dart';

class VerifyCodeResetPassword {
  Crud crud;
  VerifyCodeResetPassword(this.crud);
  postdata(String email , String verifycode ) async {
    var response = await crud.postData(AppLink.verifycoderesetpassword, {
      "email" : email ,
      "verifycode" : verifycode
    });
    return response.fold((l) => l, (r) => r);
  }
}