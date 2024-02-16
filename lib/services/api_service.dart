import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const endPoint = "https://5zld2.wiremockapi.cloud";

  var client = http.Client();

  Future getChartData() async {
    var url = Uri.parse('$endPoint/chart-data');
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

  Future getTableData() async {
    var url = Uri.parse('$endPoint/table-data');
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

  Future getTableNoHeaders() async {
    var url = Uri.parse('$endPoint/table-headers');
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

  Future getRangeChart() async {
    var url = Uri.parse('$endPoint/range-chart');
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
