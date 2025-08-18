/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/linkapi.dart';
import 'package:flutter/material.dart';

class CustomEventsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imageName ;
  // final void Function()? onPressed;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomEventsCartList({
    super.key,
    required this.name,
    required this.price, required this.imageName,  required this.count, this.onAdd, this.onRemove,
    // required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Appcolor.searchcolor,
      child: Container(
        child: Row(children: [
          // Expanded(
          //   child: IconButton(
          //     icon: Icon(Icons.delete_forever_outlined , color: Colors.red,),
          //     onPressed: onPressed,
          //   ),
          // ),
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imageEvents}/$imageName",
                height: 80,
                fit: BoxFit.cover,
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name,
                    style: const TextStyle(fontSize: 15, color: Colors.white)),
                subtitle: Text("$price \TND",
                    style: const TextStyle(color: Appcolor.pink, fontSize: 17)),
              )),
          
          Expanded(
              child: Column(
            children: [
              SizedBox(
                  height: 35,
                  child: IconButton(onPressed: onAdd, icon: Icon(Icons.add , color: Colors.grey[400],))),
              SizedBox(
                  height: 20,
                  child: Text(
                    count,
                    style: const TextStyle(fontFamily: "sans" , color: Colors.white),
                  )),
              SizedBox(
                  height: 30,
                  child: IconButton(onPressed: onRemove, icon: Icon(Icons.remove , color: Colors.grey[400],)))
            ],
          ))
        ]),
      ),
    );
  }
}
