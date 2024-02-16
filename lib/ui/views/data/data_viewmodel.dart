import 'package:flutter/material.dart';
import 'package:my_chart_app/app/app.dialogs.dart';
import 'package:my_chart_app/app/app.locator.dart';
import 'package:my_chart_app/common/helpers.dart';
import 'package:my_chart_app/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DataViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _dialogService = locator<DialogService>();

  TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;

  bool _isfetching = false;
  bool get isFetching => _isfetching;

  Map _apiData = {};
  Map get apiData => _apiData;

  Map _chartData = {};
  Map get chartData => _chartData;

  Map _tableData = {};
  Map get tableData => _tableData;

  Map _rangeData = {};
  Map get rangeData => _rangeData;

  Map _tableDataHeaders = {};
  Map get tableDataHeaders => _tableDataHeaders;

  List<String> _tableHeaders = [];
  List<String> get tableHeaders => _tableHeaders;

  List<String> _tableHeaders2 = [];
  List<String> get tableHeaders2 => _tableHeaders2;

  Future fetchPosts() async {
    _apiData.clear();
    _apiData = await _apiService.getChartData();
    return _apiData;
  }

  getChartData() async {
    _chartData.clear();
    var apiData = await _apiService.getChartData();
    _chartData = apiData['data'];
  }

  getRangeData() async {
    _rangeData.clear();
    var apiData = await _apiService.getRangeChart();
    _rangeData = apiData['data'];
  }

  getTableData() async {
    _tableData.clear();
    _tableDataHeaders.clear();
    //
    var apiData = await _apiService.getTableData();
    var apiTable = await _apiService.getTableNoHeaders();
    //
    _tableData = apiData['data'];
    _tableDataHeaders = apiTable['data'];
    //
    var noOfTitles = getKeysFromMapWithMaxKeys(apiData['data']['data']);
    var noOfHeaders = getKeysFromMapWithMaxKeys(apiTable['data']['data']);
    //
    _tableHeaders = noOfTitles;
    _tableHeaders2 = noOfHeaders;
  }

  getData() async {
    updateData(true);
    await getChartData();
    await getRangeData();
    await getTableData();
    notifyListeners();
    updateData(false);
  }

  Future getDataFronUrl(String url) async {
    if (url == '' || url.isEmpty) {
      return 'empty link';
    }
    updateData(true);
    var apiData = await _apiService.getRandomData(url);
    print(apiData);
    notifyListeners();
    updateData(false);
  }

  updateData(bool state) {
    _isfetching = state;
    notifyListeners();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.enterLink,
      title: 'Enter Url',
      description: 'Enter custom url',
    );
  }
}
