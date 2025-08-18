/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'dart:io';

checkInternet() async {

  try {

    var result = await InternetAddress.lookup("google.com"); //internetadress.lookup function mawjooda tebaa flutter tasti ms fl google
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }

  }on SocketException catch(_){
    return false;
  }
}