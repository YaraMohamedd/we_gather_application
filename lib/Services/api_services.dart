import 'dart:convert';

import 'package:we_gather_application/Models/most_sharing_model.dart';
import 'package:http/http.dart'as http;

class Wanderguide{
  Future<MostSharing> getSharing () async {
    var Api=Uri.parse("https://wanderguide.net/api/TrendingEvents");
    final response = await http.get(Api);
    if (response.statusCode == 200){
      final json = jsonDecode(response.body);
      return MostSharing.fromJson(json);
    }
    else {
      throw Exception('Error');
    }
  }
}