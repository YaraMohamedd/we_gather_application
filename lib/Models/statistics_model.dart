// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Statistics statisticsFromJson(String str) => Statistics.fromJson(json.decode(str));

String statisticsToJson(Statistics data) => json.encode(data.toJson());

class Statistics {
  Statistics({
    this.users,
    this.events,
    this.tickets,
    this.sponsers,
  });

  int users;
  int events;
  int tickets;
  int sponsers;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    users: json["users"],
    events: json["events"],
    tickets: json["tickets"],
    sponsers: json["sponsers"],
  );

  Map<String, dynamic> toJson() => {
    "users": users,
    "events": events,
    "tickets": tickets,
    "sponsers": sponsers,
  };
}
