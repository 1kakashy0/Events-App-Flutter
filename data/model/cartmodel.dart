/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

class CartModel {
  int? eventsprice;
  int? countevents;
  int? cartId;
  int? cartUsersid;
  int? cartEventsid;
  int? eventId;
  String? eventName;
  String? eventNameAr;
  String? eventNameFr;
  String? eventDesc;
  String? eventDescAr;
  String? eventDescFr;
  String? eventImage;
  int? eventCount;
  int? eventActive;
  int? eventPrice;
  int? eventDiscount;
  String? eventDate;
  int? eventCat;
  String? eventLocation;
  String? eventPhoneNumber;
  String? eventEmail;

  CartModel(
      {this.eventsprice,
      this.countevents,
      this.cartId,
      this.cartUsersid,
      this.cartEventsid,
      this.eventId,
      this.eventName,
      this.eventNameAr,
      this.eventNameFr,
      this.eventDesc,
      this.eventDescAr,
      this.eventDescFr,
      this.eventImage,
      this.eventCount,
      this.eventActive,
      this.eventPrice,
      this.eventDiscount,
      this.eventDate,
      this.eventCat,
      this.eventLocation,
      this.eventPhoneNumber,
      this.eventEmail});

  CartModel.fromJson(Map<String, dynamic> json) {
    eventsprice = json['eventsprice'];
    countevents = json['countevents'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartEventsid = json['cart_eventsid'];
    eventId = json['event_id'];
    eventName = json['event_name'];
    eventNameAr = json['event_name_ar'];
    eventNameFr = json['event_name_fr'];
    eventDesc = json['event_desc'];
    eventDescAr = json['event_desc_ar'];
    eventDescFr = json['event_desc_fr'];
    eventImage = json['event_image'];
    eventCount = json['event_count'];
    eventActive = json['event_active'];
    eventPrice = json['event_price'];
    eventDiscount = json['event_discount'];
    eventDate = json['event_date'];
    eventCat = json['event_cat'];
    eventLocation = json['event_location'];
    eventPhoneNumber = json['event_phone_number'];
    eventEmail = json['event_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventsprice'] = this.eventsprice;
    data['countevents'] = this.countevents;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_eventsid'] = this.cartEventsid;
    data['event_id'] = this.eventId;
    data['event_name'] = this.eventName;
    data['event_name_ar'] = this.eventNameAr;
    data['event_name_fr'] = this.eventNameFr;
    data['event_desc'] = this.eventDesc;
    data['event_desc_ar'] = this.eventDescAr;
    data['event_desc_fr'] = this.eventDescFr;
    data['event_image'] = this.eventImage;
    data['event_count'] = this.eventCount;
    data['event_active'] = this.eventActive;
    data['event_price'] = this.eventPrice;
    data['event_discount'] = this.eventDiscount;
    data['event_date'] = this.eventDate;
    data['event_cat'] = this.eventCat;
    data['event_location'] = this.eventLocation;
    data['event_phone_number'] = this.eventPhoneNumber;
    data['event_email'] = this.eventEmail;
    return data;
  }
}