/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class EventPosition extends GetView<ProductDetailsControllerImp> {
  const EventPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 300,
        width: double.infinity,
        child: GetBuilder<ProductDetailsControllerImp>(
          init: controller, // Initialize the controller
          builder: (controller) {
            return FlutterMap(
              options: MapOptions(
                initialCenter: controller.initialPosition ?? LatLng(controller.eventsModel.addressLat!, controller.eventsModel.addressLong!), // Use initial position from the controller
                initialZoom: 14.4746,
              ),
              mapController: controller.mapController,
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: controller.markers, // Display markers on the map
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}