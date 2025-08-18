/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

class EventsModel {
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
  int? eventsPriceDiscount;
  String? eventLocation;
  String? eventPhoneNumber;
  String? eventEmail;
  double? addressLat;
  double? addressLong;
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesNameFr;
  String? categoriesImage;
  String? categoriesDatetime;
  int? favorite;
  
  EventsModel({
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
    this.eventsPriceDiscount,
    this.eventLocation,
    this.eventPhoneNumber,
    this.eventEmail,
    this.addressLat,
    this.addressLong,
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesNameFr,
    this.categoriesImage,
    this.categoriesDatetime,
    this.favorite,
  });

  EventsModel.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    eventName = json['event_name'];
    eventNameAr = json['event_name_ar'];
    eventNameFr = json['event_name_fr'];
    eventDesc = json['event_desc'];
    eventDescAr = json['event_desc_ar'];
    eventDescFr = json['event_desc_fr'];
    eventImage = json['event_image'];
    eventCount = json['event_count'] is int ? json['event_count'] : (json['event_count'] as double?)?.toInt();
    eventActive = json['event_active'] is int ? json['event_active'] : (json['event_active'] as double?)?.toInt();
    eventPrice = json['event_price'] is int ? json['event_price'] : (json['event_price'] as double?)?.toInt();
    eventDiscount = json['event_discount'] is int ? json['event_discount'] : (json['event_discount'] as double?)?.toInt();
    eventDate = json['event_date'];
    eventCat = json['event_cat'] is int ? json['event_cat'] : (json['event_cat'] as double?)?.toInt();
    eventsPriceDiscount = json['eventspricediscount'] is int ? json['eventspricediscount'] : (json['eventspricediscount'] as double?)?.toInt();
    eventLocation = json['event_location'];
    eventPhoneNumber = json['event_phone_number'];
    eventEmail = json['event_email'];
    addressLat = json['address_lat'] is int ? (json['address_lat'] as int).toDouble() : json['address_lat'];
  addressLong = json['address_long'] is int ? (json['address_long'] as int).toDouble() : json['address_long'];
    categoriesId = json['categories_id'] is int ? json['categories_id'] : (json['categories_id'] as double?)?.toInt();
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesNameFr = json['categories_name_fr'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'] is int ? json['favorite'] : (json['favorite'] as double?)?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['eventspricediscount'] = this.eventsPriceDiscount;
    data['event_location'] = this.eventLocation;
    data['event_phone_number'] = this.eventPhoneNumber;
    data['event_email'] = this.eventEmail;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_name_fr'] = this.categoriesNameFr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    data['favorite'] = this.favorite;
    return data;
  }
}
