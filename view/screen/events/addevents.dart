/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/events/addevent_controller.dart';
import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEvents extends StatelessWidget {
  const AddEvents({super.key});

  @override
  Widget build(BuildContext context) {
    AddEventscontroller controller = Get.put(AddEventscontroller());

    return Scaffold(
      backgroundColor: Appcolor.bkcolor,
      appBar: AppBar(
      backgroundColor: Appcolor.bkcolor,
      elevation: 5,
      leading:
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            Get.back() ;
                          }, icon: const Icon(Icons.arrow_back , color: Colors.white,)),
                    )),
                    title:  Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                      'Add Event',
                        style: const TextStyle(fontSize: 25 , color: Appcolor.pink , fontWeight: FontWeight.bold
                        ),
                      ),
                    )),
                )  ,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Event Details",
                style: TextStyle(color: Colors.white , fontSize: 20) ,
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: controller.eventname,
                label: 'Event Name (EN)',
                icon: Icons.text_fields,
              ),
              _buildTextField(
                controller: controller.eventnamear,
                label: 'Event Name (AR)',
                icon: Icons.text_fields,
              ),
              _buildTextField(
                controller: controller.eventnamefr,
                label: 'Event Name (FR)',
                icon: Icons.text_fields,
              ),
              _buildTextField(
                controller: controller.eventdesc,
                label: 'Event Description (EN)',
                icon: Icons.description,
                maxLines: 3,
              ),
              _buildTextField(
                controller: controller.eventdescar,
                label: 'Event Description (AR)',
                icon: Icons.description,
                maxLines: 3,
              ),
              _buildTextField(
                controller: controller.eventdescfr,
                label: 'Event Description (FR)',
                icon: Icons.description,
                maxLines: 3,
              ),
              SizedBox(height: 20),
              Text(
                "Event Image",
                style: TextStyle(color: Colors.white , fontSize: 20) ,
              ),
              SizedBox(height: 10),
              GetBuilder<AddEventscontroller>(
                builder: (_) {
                  return controller.file != null
                      ? Image.file(controller.file!, height: 150)
                      : Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                            child: Text(
                              'No Image Selected',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        );
                },
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    controller.chooseImage();
                  },
                  icon: Icon(Icons.image),
                  label: Text('Pick Event Image'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Event Settings",
                style: TextStyle(color: Colors.white , fontSize: 20) ,
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: controller.eventcount,
                label: 'Event Count',
                icon: Icons.confirmation_number,
                keyboardType: TextInputType.number,
              ),
              _buildTextField(
                controller: controller.eventprice,
                label: 'Event Price',
                icon: Icons.attach_money,
                keyboardType: TextInputType.number,
              ),
              _buildTextField(
                controller: controller.eventdiscount,
                label: 'Event Discount',
                icon: Icons.discount,
                keyboardType: TextInputType.number,
              ),
              _buildTextField(
                controller: controller.eventdate,
                label: 'Event Date',
                icon: Icons.calendar_today,
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 10),
              GetBuilder<AddEventscontroller>(
                builder: (controller) {
                  return FutureBuilder(
                    future: controller.getCategoriesData.getdata(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return DropdownButtonFormField(
                          hint: Text("Select category"),
                          items: snapshot.data!.map<DropdownMenuItem>((category) {
                            return DropdownMenuItem(
                              child: Text(category.categoriesName!),
                              value: category.categoriesId,
                            );
                          }).toList(),
                          value: controller.selectedCategoryId,
                          onChanged: (value) {
                            controller.selectCategory(value!);
                            controller.update();
                          },
                          decoration: InputDecoration(
                            labelText: 'Event Category',
                            prefixIcon: Icon(Icons.category),
                            border: OutlineInputBorder(),
                          ),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              Text(
                "Contact Information",
                style: TextStyle(color: Colors.white , fontSize: 20) ,
              ),
              SizedBox(height: 10), 
              _buildTextField(
                controller: controller.eventlocation,
                label: 'Event Location',
                icon: Icons.location_on,
              ),
              _buildTextField(
                controller: controller.eventphone,
                label: 'Event Phone',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              _buildTextField(
                controller: controller.eventemail,
                label: 'Event Email',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30),
              Center(
                child: GetBuilder<AddEventscontroller>(
                  builder: (_) {
                    return controller.statusRequest == StatusRequest.loading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              controller.addEvent();
                            },
                            child: Text('Add Event'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    IconData? icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon) : null,
          border: OutlineInputBorder(),
        ),
        maxLines: maxLines,
        keyboardType: keyboardType,
      ),
    );
  }
}
