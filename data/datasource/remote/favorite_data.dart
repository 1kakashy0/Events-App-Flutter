/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/class/crud.dart';
import 'package:event_project/linkapi.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  addFavorite(String usersid, String eventsid) async {
    var response = await crud.postData(
        AppLink.favoriteAdd, {"usersid": usersid, "eventsid": eventsid});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String eventsid) async {
    var response = await crud.postData(
        AppLink.favoriteRemove, {"usersid": usersid, "eventsid": eventsid});
    return response.fold((l) => l, (r) => r);
  }

  
}
