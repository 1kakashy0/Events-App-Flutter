/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/class/crud.dart';
import 'package:event_project/data/model/categoriesmodel.dart';
import 'package:event_project/linkapi.dart';  // Your API link file

abstract class DataGetter {
  Future<List<CategoriesModel>> getdata();
}

class GetCategoriesData extends DataGetter {
  Crud crud;

  GetCategoriesData(this.crud);

  @override
  Future<List<CategoriesModel>> getdata() async {
    var response = await crud.postData(AppLink.getCategories, {});

    return response.fold(
      (statusRequest) => Future.error(statusRequest),
      (map) {
        List<CategoriesModel> categories = (map['data'] as List)
            .map((category) => CategoriesModel.fromJson(category))
            .toList();
        return categories;
      },
    );
  }
}