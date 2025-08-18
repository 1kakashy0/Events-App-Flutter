/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************


import 'package:event_project/core/class/crud.dart';
import 'package:event_project/linkapi.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postdata(String username ,String email , String password ,String phone ) async {
    var response = await crud.postData(AppLink.signUp, {
      "username" : username , 
      "email" : email ,
      "password" : password  ,
      "phone" : phone  ,
    });
    return response.fold((l) => l, (r) => r);
  }
}