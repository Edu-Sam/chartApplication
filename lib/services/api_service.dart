import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const endPoint = 'https://19mvl.wiremockapi.cloud';

  var client = http.Client();

  Future getChartData() async {
    print('object');
    var url = Uri.parse('$endPoint/chart-data/');
    Map chartData = {};
    print('bjscbjs');
    var response = await client.get(
      url,
    );
    try {
      chartData = json.decode(response.body);
      print('qbwuwd');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    if (response.statusCode == 200) {
      print('quwyusjnbdghs');
      return chartData;
    } else {
      return {"status": "Error", "message": "error in api call"};
    }
  }

  Future getRandomData(String randomUrl) async {
    print('object');
    var url = Uri.parse(randomUrl);
    Map chartData = {};
    print('bjscbjs');
    var response = await client.get(
      url,
    );
    try {
      chartData = json.decode(response.body);
      print('qbwuwd');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    if (response.statusCode == 200) {
      print('quwyusjnbdghs');
      return chartData;
    } else {
      return {"status": "Error", "message": "error in api call"};
    }
  }
}
