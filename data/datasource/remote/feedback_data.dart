/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'dart:io';

import 'package:event_project/core/class/crud.dart';
import 'package:event_project/linkapi.dart';

class FeedBackData {
  Crud crud;
  FeedBackData(this.crud);

  Future<dynamic> postdata(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.submitfeedback, data);
    } else {
      response = await crud.addRequestWithImageOne(AppLink.submitfeedback, data, file);
    }
    // Ensure that response is returned, even if it's null
    return response?.fold((l) => l, (r) => r) ?? {'status': 'error', 'message': 'No response from server'};
  }

  getData(String eventid) async {
    var response = await crud.postData(AppLink.getfeedback, {"eventid": eventid});
    return response.fold((l) => l, (r) => r);
  }
}