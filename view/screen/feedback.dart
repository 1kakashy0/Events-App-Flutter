/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:event_project/controller/feedback_controller.dart';
// import 'package:event_project/core/class/handlingdataview.dart';
// import 'package:event_project/core/constant/colors.dart';
// import 'package:event_project/core/constant/imageasset.dart';
// import 'package:event_project/linkapi.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jiffy/jiffy.dart';

// class AddFeedBack extends StatelessWidget {
//   const AddFeedBack({super.key});

//   @override
//   Widget build(BuildContext context) {
//     FeedBackController controller = Get.put(FeedBackController());
//     return Scaffold(
//       backgroundColor: Appcolor.bkcolor,
//       appBar: AppBar(
//       backgroundColor: Appcolor.bkcolor,
//       elevation: 5,
//       leading:
//                     Expanded(
//                         child: Container(
//                       alignment: Alignment.centerLeft,
//                       child: IconButton(
//                           onPressed: () {
//                             Get.back() ;
//                           }, icon: const Icon(Icons.arrow_back , color: Colors.white,)),
//                     )),
//                     title:  Expanded(
//                         child: Container(
//                       alignment: Alignment.center,
//                       child: Text(
//                       'FeedBacks',
//                         style: const TextStyle(fontSize: 25 , color: Appcolor.pink , fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     )),
//                 )  ,
//       body: Container(
//         padding: const EdgeInsets.all(10),
//         child: GetBuilder<FeedBackController>(
//             builder: ((controller) => HandlingDataView(
//                 statusRequest: controller.statusRequest,
//                 widget: ListView(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           ...List.generate(
//                             controller.data.length,
//                             (index) => Container(
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Container(
//                                         child: CircleAvatar(
//                                           radius: 20,
//                                           backgroundColor: Appcolor.bkcolor,
//                                           backgroundImage: const AssetImage(
//                                               Imageasset.avatar1),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(
//                                         controller.data[index].usersName
//                                             .toString(),
//                                         textAlign: TextAlign.start,
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                           textAlign: TextAlign.end,
//                                           Jiffy.parse(controller
//                                                   .data[index].createdAt!)
//                                               .fromNow(),
//                                           style: const TextStyle(
//                                               color: Appcolor.pink,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                   SizedBox(height: 10),
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                           controller.data[index].comment
//                                               .toString(),
//                                           textAlign: TextAlign.start ,
//                                           style: TextStyle(color: Colors.white),),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       controller.notNull(controller
//                                                   .data[index].photoUrl) ==
//                                               true
//                                           ? CachedNetworkImage(
//                                                 imageUrl:
//                                                     "${AppLink.imageFeedback}/${controller.data[index].photoUrl}",
//                                                 height: 100,

//                                                 // fit: BoxFit.cover,
//                                               )
//                                           : Container()
//                                     ],
//                                   ),
//                                   SizedBox(height: 20),
//                                   Divider()
//                                   // if (controller.data[index].rating.toString() != "Null") {
//                                   //   Text(controller.data[index].rating.toString()) ;
//                                   // },
//                                   // SizedBox(height: 10),
//                                   // Text(controller.data[index].status.toString()),
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 )))),
//       ),
//       // Padding(
//       //   padding: const EdgeInsets.all(20.0),
//       //   child: Expanded(
//       //     child: TextField(
//       //       controller: controller.rating,
//       //       decoration: InputDecoration(
//       //         labelText: 'Enter your rating',
//       //         border: OutlineInputBorder(),
//       //       ),
//       //     ),
//       //   ),
//       // ),
//       bottomNavigationBar: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         height: 50,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(50),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(0, 3), // changes position of shadow
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Expanded(
//               child: TextField(
//                 controller: controller.comment,
//                 decoration: InputDecoration(
//                   labelText: 'Enter your feedback',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             GetBuilder<FeedBackController>(
//               builder: (_) {
//                 return controller.file != null
//                     ? Image.file(controller.file!)
//                     : Container();
//               },
//             ),
//             InkWell(
//               onTap: () {
//                 controller.chooseImage();
//               },
//               child: Icon(Icons.photo),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             InkWell(
//               onTap: controller.addFeedback,
//               child: Icon(Icons.send),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_project/controller/feedback_controller.dart';
import 'package:event_project/core/class/handlingdataview.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/constant/imageasset.dart';
import 'package:event_project/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class AddFeedBack extends StatelessWidget {
  const AddFeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    FeedBackController controller = Get.put(FeedBackController());

    return Scaffold(
      backgroundColor: Appcolor.bkcolor,
      appBar: AppBar(
        backgroundColor: Appcolor.bkcolor,
        elevation: 5,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          'Feedbacks',
          style: TextStyle(
            fontSize: 25,
            color: Appcolor.pink,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<FeedBackController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Column(
                  children: [
                    ...List.generate(
                      controller.data.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: const AssetImage(
                                    Imageasset.avatar1,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  controller.data[index].usersName.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  Jiffy.parse(
                                    controller.data[index].createdAt!,
                                  ).fromNow(),
                                  style: const TextStyle(
                                    color: Appcolor.pink,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              controller.data[index].comment.toString(),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 10),
                            if (controller.notNull(controller.data[index].photoUrl))
                              CachedNetworkImage(
                                imageUrl: "${AppLink.imageFeedback}/${controller.data[index].photoUrl}",
                                height: 150,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            const SizedBox(height: 15),
                            const Divider(color: Colors.white24),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.comment,
                maxLines: null,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade700,
                  hintText: 'Enter your feedback...',
                  hintStyle: const TextStyle(color: Colors.white60),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            GetBuilder<FeedBackController>(
              builder: (_) => controller.file != null
                  ? Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(controller.file!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        controller.chooseImage();
                      },
                      child: const Icon(Icons.photo, color: Colors.white),
                    ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: controller.addFeedback,
              child: const Icon(Icons.send, color: Appcolor.pink),
            ),
          ],
        ),
      ),
    );
  }
}
