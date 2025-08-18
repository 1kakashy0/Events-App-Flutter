/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/events/events_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/functions/translatedatabase.dart';
import 'package:event_project/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesEvents extends GetView<EventsControllerImp> {
  const ListCategoriesEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<EventsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({
    super.key,
    required this.categoriesModel,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {
          controller.changeCat(i! , categoriesModel.categoriesId!.toString());
          // controller.goToEvents(controller.categories , i! );
        },
        child: Column(
          children: [
            GetBuilder<EventsControllerImp>(
                builder: (controller) => Container(
                      padding: const EdgeInsets.only(left: 5 , right: 5 , bottom: 5),
                      decoration: controller.selectedCat == i
                          ? const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(width: 3, color: Appcolor.pink)),
                            )
                          : null,
                      child: Container(
                        padding: const  EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Appcolor.searchcolor ,),
                        child: Text(
                          "${translateDataBase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName, categoriesModel.categoriesNameFr)}",
                          style:
                              const TextStyle(fontSize: 17, color: Appcolor.circle),
                        ),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
