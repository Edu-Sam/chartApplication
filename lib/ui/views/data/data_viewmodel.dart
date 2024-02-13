import 'package:my_chart_app/app/app.locator.dart';
import 'package:my_chart_app/services/api_service.dart';
import 'package:stacked/stacked.dart';

class DataViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();

  bool _isfetching = false;
  bool get isFetching => _isfetching;

  Map _apiData = {};
  Map get apiData => _apiData;

  Map _chartData = {};
  Map get chartData => _chartData;

  Map _tableData = {};
  Map get tableData => _tableData;

  Future fetchPosts() async {
    _apiData.clear();
    _apiData = await _apiService.getChartData();
    return _apiData;
  }

  void getData() async {
    updateData(true);
    var apiData = await fetchPosts();
    _tableData = apiData['datagrid'];
    _chartData = apiData['charts'];
    notifyListeners();
    updateData(false);
  }

  updateData(bool state) {
    _isfetching = state;
    notifyListeners();
  }
}
