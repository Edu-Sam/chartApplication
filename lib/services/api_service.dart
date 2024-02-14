import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const endPoint = 'https://19mvl.wiremockapi.cloud';
  static const _endpoint = "https://5zld2.wiremockapi.cloud";

  var client = http.Client();

  Future getChartData() async {
    var url = Uri.parse('$endPoint/chart-data/');
    Map chartData = {};
    var response = await client.get(
      url,
    );
    try {
      chartData = json.decode(response.body);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    if (response.statusCode == 200) {
      return chartData;
    } else {
      return {"status": "Error", "message": "error in api call"};
    }
  }

  Future getChartDataTable() async {
    var url = Uri.parse('$_endpoint/chart-data-partial');
    Map chartData = {};
    var response = await client.get(
      url,
    );
    try {
      chartData = json.decode(response.body);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    if (response.statusCode == 200) {
      return chartData;
    } else {
      return {"status": "Error", "message": "error in api call"};
    }
  }

  Future getDataNoHeaders() async {
    var url = Uri.parse('$_endpoint/table-headers');
    Map chartData = {};
    var response = await client.get(
      url,
    );
    try {
      chartData = json.decode(response.body);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    if (response.statusCode == 200) {
      return chartData;
    } else {
      return {"status": "Error", "message": "error in api call"};
    }
  }

  Future getRandomData(String randomUrl) async {
    var url = Uri.parse(randomUrl);
    Map chartData = {};
    var response = await client.get(
      url,
    );
    try {
      chartData = json.decode(response.body);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    if (response.statusCode == 200) {
      return chartData;
    } else {
      return {"status": "Error", "message": "error in api call"};
    }
  }
}
