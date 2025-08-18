/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/class/statusrequest.dart';

handlingData(response) {
  if (response is StatusRequest) {
    return response ;
  } else {
    return StatusRequest.susccess;
  }
}
