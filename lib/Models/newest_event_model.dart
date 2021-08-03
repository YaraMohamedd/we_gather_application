// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<NewestEvent> eventFromJson(String str) => List<NewestEvent>.from(json.decode(str).map((x) => NewestEvent.fromJson(x)));

String eventToJson(List<NewestEvent> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewestEvent {
  NewestEvent({
    this.details,
    this.dates,
  });

  Detailss details;
  List<Dates> dates;

  factory NewestEvent.fromJson(Map<String, dynamic> json) => NewestEvent(
    details: Detailss.fromJson(json["details"]),
    dates: List<Dates>.from(json["dates"].map((x) => Dates.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "details": details.toJson(),
    "dates": List<dynamic>.from(dates.map((x) => x.toJson())),
  };
}

class Dates {
  Dates({
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

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
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

class Detailss {
  Detailss({
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

  factory Detailss.fromJson(Map<String, dynamic> json) => Detailss(
    id: json["id"],
    titleAr: json["title_ar"],
    titleEn: json["title_en"],
    descriptionAr: json["description_ar"],
    descriptionEn: json["description_en"],
    cover: json["cover"],
    lng: json["lng"],
    lat: json["lat"],
    price: json["price"],
    addressId: json["address_id"],
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
    "address_id": addressId,
    "vendor_id": vendorId,
    "category_id": categoryId,
    "qr": qr,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "type": type,
    "url": url,
  };
}
