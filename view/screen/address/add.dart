/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

// import 'package:event_project/controller/address/add_controller.dart';
// import 'package:event_project/core/class/handlingdataview.dart';
// import 'package:event_project/core/constant/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class AddressAdd extends StatelessWidget {
//   const AddressAdd({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     AddAddressController controllerpage = Get.put(AddAddressController());
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('add new address'),
//       ),
//       body: Container(
//         child: GetBuilder<AddAddressController>(
//             builder: ((controllerpage) => HandlingDataView(
//                 statusRequest: controllerpage.statusRequest,
//                 widget: Column(children: [
//                   if (controllerpage.kGooglePlex != null)
//                     Expanded(
//                         child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         GoogleMap(
//                           mapType: MapType.normal,
//                           markers: controllerpage.markers.toSet(),
//                           onTap: (latlong) {
//                             controllerpage.addMarkers(latlong);
//                           },
//                           initialCameraPosition: controllerpage.kGooglePlex!,
//                           onMapCreated: (GoogleMapController controllermap) {
//                             controllerpage.completercontroller!
//                                 .complete(controllermap);
//                           },
//                         ),
//                         Positioned(
//                           bottom: 10,
//                           child: Container(
//                             child: MaterialButton(
//                               minWidth: 200,
//                               onPressed: () {
//                                 controllerpage.goToPageAddDetailsAddress();
//                               },
//                               child:
//                                   Text("اكمال", style: TextStyle(fontSize: 18)),
//                               color: Appcolor.pink,
//                               textColor: Colors.white,
//                             ),
//                           ),
//                         )
//                       ],
//                     ))
//                 ])))),
//       ),
//     );
//   }
// }


import 'package:event_project/controller/address/add_controller.dart';
import 'package:event_project/core/class/handlingdataview.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressController controllerpage = Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Address'),
      ),
      body: Container(
        child: GetBuilder<AddAddressController>(
          builder: (controllerpage) => HandlingDataView(
            statusRequest: controllerpage.statusRequest,
            widget: Column(
              children: [
                if (controllerpage.initialPosition != null)
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        FlutterMap(
                          options: MapOptions(
                            initialCenter: controllerpage.initialPosition!,
                            initialZoom: 14.4746,
                            onTap: (tapPosition, latLng) {
                              controllerpage.addMarkers(latLng);
                            },
                          ),
                          mapController: controllerpage.mapController,
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                              subdomains: ['a', 'b', 'c'],
                            ),
                            MarkerLayer(
                              markers: controllerpage.markers,
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          child: Container(
                            child: MaterialButton(
                              minWidth: 200,
                              onPressed: () {
                                controllerpage.goToPageAddDetailsAddress();
                              },
                              child: Text("Continue", style: TextStyle(fontSize: 18)),
                              color: Appcolor.pink,
                              textColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

