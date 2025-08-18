/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

class FeedBackModel {
  int? id;
  int? userId;
  int? eventid;
  String? comment;
  int? rating;
  String? photoUrl;
  String? createdAt;
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
  int? eventTableId;
  int? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPhone;
  int? usersVerfiycode;
  int? usersApprove;
  String? usersCreate;
  String? usersPassword;

  FeedBackModel(
      {this.id,
      this.userId,
      this.eventid,
      this.comment,
      this.rating,
      this.photoUrl,
      this.createdAt,
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
      this.eventEmail,
      this.eventTableId,
      this.usersId,
      this.usersName,
      this.usersEmail,
      this.usersPhone,
      this.usersVerfiycode,
      this.usersApprove,
      this.usersCreate,
      this.usersPassword});

  FeedBackModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    eventid = json['eventid'];
    comment = json['comment'];
    rating = json['rating'];
    photoUrl = json['photo_url'];
    createdAt = json['created_at'];
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
    eventTableId = json['eventTable_id'];
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersVerfiycode = json['users_verfiycode'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
    usersPassword = json['users_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['eventid'] = this.eventid;
    data['comment'] = this.comment;
    data['rating'] = this.rating;
    data['photo_url'] = this.photoUrl;
    data['created_at'] = this.createdAt;
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
    data['eventTable_id'] = this.eventTableId;
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_verfiycode'] = this.usersVerfiycode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    data['users_password'] = this.usersPassword;
    return data;
  }
}
