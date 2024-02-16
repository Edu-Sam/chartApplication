import 'package:my_chart_app/app/app.locator.dart';
import 'package:my_chart_app/common/helpers.dart';
import 'package:my_chart_app/services/api_service.dart';
import 'package:stacked/stacked.dart';

class DataTableViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  bool _isfetching = false;
  bool get isFetching => _isfetching;

  Map _tableData = {};
  Map get tableData => _tableData;

  Map _tableDataHeaders = {};
  Map get tableDataHeaders => _tableDataHeaders;

  List<String> _tableHeaders = [];
  List<String> get tableHeaders => _tableHeaders;

  List<String> _tableHeaders2 = [];
  List<String> get tableHeaders2 => _tableHeaders2;

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
    await getTableData();
    notifyListeners();
    updateData(false);
  }

  updateData(bool state) {
    _isfetching = state;
    notifyListeners();
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
}
