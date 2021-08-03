// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AllEventsModel allEventsFromJson(String str) =>
    AllEventsModel.fromJson(json.decode(str));

String allEventsToJson(AllEventsModel data) => json.encode(data.toJson());

class AllEventsModel {
  AllEventsModel({
    this.status,
    this.msg,
    this.data,
  });

  bool status;
  int msg;
  Data data;

  factory AllEventsModel.fromJson(Map<String, dynamic> json) => AllEventsModel(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.events,
  });

  List<Event> events;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    this.details,
    this.dates,
    this.likes,
  });

  Details details;
  List<Date> dates;
  int likes;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        details: Details.fromJson(json["details"]),
        dates: List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
        likes: json["likes"],
      );

  Map<String, dynamic> toJson() => {
        "details": details.toJson(),
        "dates": List<dynamic>.from(dates.map((x) => x.toJson())),
        "likes": likes,
      };
}

class Date {
  Date({
    this.id,
    this.startDate,
    this.endDate,
    this.eventId,
    this.createdAt,
    this.updatedAt,
    this.maxCapacity,
    this.availableSeats,
  });

  int id;
  DateTime startDate;
  DateTime endDate;
  String eventId;
  DateTime createdAt;
  DateTime updatedAt;
  String maxCapacity;
  String availableSeats;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        id: json["id"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        eventId: json["event_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        maxCapacity: json["max_capacity"],
        availableSeats: json["available_seats"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "event_id": eventId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "max_capacity": maxCapacity,
        "available_seats": availableSeats,
      };
}

class Details {
  Details({
    this.id,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.cover,
    this.lng,
    this.lat,
    this.price,
    this.addressId,
    this.vendorId,
    this.categoryId,
    this.qr,
    this.createdAt,
    this.updatedAt,
    this.type,
    this.url,
  });

  int id;
  String titleAr;
  String titleEn;
  String descriptionAr;
  String descriptionEn;
  String cover;
  String lng;
  String lat;
  String price;
  String addressId;
  String vendorId;
  String categoryId;
  String qr;
  DateTime createdAt;
  DateTime updatedAt;
  String type;
  String url;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json["id"],
        titleAr: json["title_ar"],
        titleEn: json["title_en"],
        descriptionAr: json["description_ar"],
        descriptionEn: json["description_en"],
        cover: json["cover"],
        lng: json["lng"],
        lat: json["lat"],
        price: json["price"],
        addressId: json["address_id"] == null ? null : json["address_id"],
        vendorId: json["vendor_id"],
        categoryId: json["category_id"],
        qr: json["qr"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title_ar": titleAr,
        "title_en": titleEn,
        "description_ar": descriptionAr,
        "description_en": descriptionEn,
        "cover": cover,
        "lng": lng,
        "lat": lat,
        "price": price,
        "address_id": addressId == null ? null : addressId,
        "vendor_id": vendorId,
        "category_id": categoryId,
        "qr": qr,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "type": type,
        "url": url,
      };
}
