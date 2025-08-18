/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

// import 'package:event_project/controller/home_controller.dart';
// import 'package:event_project/core/constant/colors.dart';
// import 'package:event_project/core/functions/translatedatabase.dart';
// import 'package:event_project/data/model/categoriesmodel.dart';
// import 'package:event_project/linkapi.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// // import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// class ListCategoriesHome extends GetView<HomeControllerImp> {
//   const ListCategoriesHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 120,
//       child: ListView.separated(
//         separatorBuilder: (context, index) => const SizedBox(width: 10),
//         itemCount: controller.categories.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Categories(
//             i : index ,
//             categoriesModel:
//                 CategoriesModel.fromJson(controller.categories[index]),
//           );
//         },
//       ),
//     );
//   }
// }

// class Categories extends GetView<HomeControllerImp> {
//   final CategoriesModel categoriesModel;
//   final int? i ;
//   const Categories({super.key, required this.categoriesModel , required this.i, });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         controller.goToEvents(controller.categories , i! , categoriesModel.categoriesId!.toString()  );
//     },
//       child: Column(
//         children: [
//           Container(
//               decoration: BoxDecoration(
//                   // color: Appcolor.pink,
//                   borderRadius: BorderRadius.circular(20)),
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               height: 70,
//               width: 70,
//               child: SvgPicture.network(
//                   "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
//                   color: Appcolor.circle)),
//           Text(
//             "${translateDataBase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName, categoriesModel.categoriesNameFr)}",
//             style: const TextStyle(fontSize: 13, color: Appcolor.circle),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:event_project/controller/home_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/functions/translatedatabase.dart';
import 'package:event_project/data/model/categoriesmodel.dart';
import 'package:event_project/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Corrected the import here
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

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
            categoriesModel: CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToEvents(controller.categories, i!, categoriesModel.categoriesId!.toString());
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
              color: Appcolor.circle,
              placeholderBuilder: (BuildContext context) => const CircularProgressIndicator(), // Placeholder while loading
              // errorBuilder: (context, error, stackTrace) => Icon(Icons.error, color: Colors.red), // Error icon if image fails to load
            ),
          ),
          Container(
            width: 70, // Ensure text fits the width of the category container
            child: Text(
              translateDataBase(
                categoriesModel.categoriesNameAr, 
                categoriesModel.categoriesName, 
                categoriesModel.categoriesNameFr
              ),
              style: const TextStyle(fontSize: 13, color: Appcolor.circle),
              maxLines: 1, // Limit text to a single line
              overflow: TextOverflow.ellipsis, // Handle text overflow
              textAlign: TextAlign.center, // Center the text
            ),
          ),
        ],
      ),
    );
  }
}