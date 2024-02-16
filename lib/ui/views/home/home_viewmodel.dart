import 'package:my_chart_app/app/app.bottomsheets.dart';
import 'package:my_chart_app/app/app.dialogs.dart';
import 'package:my_chart_app/app/app.locator.dart';
import 'package:my_chart_app/app/app.router.dart';
import 'package:my_chart_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  List<String> widgetTitle = [
    "Data Table",
    "Chart View",
  ];

  void navigateToWidget(String value) {
    switch (value) {
      case "Data Table":
        _navigationService.navigateToDataTableView();
        break;
      case "Chart View":
        _navigationService.navigateToDataView();

        break;
      default:
    }
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
