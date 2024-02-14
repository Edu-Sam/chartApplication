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

  List<String> _tableHeaders = [];
  List<String> get tableHeaders => _tableHeaders;

  Future fetchPosts() async {
    _apiData.clear();
    _apiData = await _apiService.getDataNoHeaders();
    return _apiData;
  }

  void getData() async {
    updateData(true);
    var apiData = await fetchPosts();
    _tableData = apiData['datagrid'];
    _chartData = apiData['charts'];
    var noOfTitles = getKeysFromMapWithMaxKeys(apiData['datagrid']['data']);
    _tableHeaders = noOfTitles;
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
