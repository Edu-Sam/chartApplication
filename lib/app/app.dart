import 'package:my_chart_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:my_chart_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:my_chart_app/ui/views/home/home_view.dart';
import 'package:my_chart_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_chart_app/ui/views/data_table/data_table_view.dart';
import 'package:my_chart_app/ui/views/data/data_view.dart';
import 'package:my_chart_app/services/api_service.dart';
import 'package:my_chart_app/ui/dialogs/enter_link/enter_link_dialog.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: DataTableView),
    MaterialRoute(page: DataView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: EnterLinkDialog),
// @stacked-dialog
  ],
)
class App {}
