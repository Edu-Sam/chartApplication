import 'package:flutter/material.dart';
import 'package:my_chart_app/ui/widgetss/chartwidget.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'data_viewmodel.dart';

class DataView extends StackedView<DataViewModel> {
  const DataView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DataViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 300,
              width: 600,
              color: Colors.purple,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Get Data from random url'),
            ),
            if (viewModel.chartData != {} || viewModel.chartData.isNotEmpty)
              if (!viewModel.isFetching)
                ChartWidgetView(
                  dataSets: viewModel.chartData['datasets'],
                  xKey: viewModel.chartData['x_axis_key'],
                  yKey: viewModel.chartData['y_axis_key'],
                  name: viewModel.chartData['chart_name'] ?? "",
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  widgetType: viewModel.chartData['chart_type'] ?? "line_chart",
                ),
            if (viewModel.chartData != {} || viewModel.chartData.isNotEmpty)
              if (!viewModel.isFetching)
                ChartWidgetView(
                  dataSets: viewModel.chartData['datasets'],
                  xKey: viewModel.chartData['x_axis_key'],
                  yKey: viewModel.chartData['y_axis_key'],
                  name: viewModel.chartData['chart_name'] ?? "",
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  widgetType: "line_chart_2",
                ),
            if (viewModel.chartData != {} || viewModel.chartData.isNotEmpty)
              if (!viewModel.isFetching)
                ChartWidgetView(
                  dataSets: viewModel.chartData['datasets'],
                  name: viewModel.chartData['chart_name'] ?? "",
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  widgetType: "spark_line",
                ),
            if (viewModel.tableData != {} || viewModel.tableData.isNotEmpty)
              ChartWidgetView(
                tableData: viewModel.tableData['data'],
                tableHeaders: viewModel.tableData['table_headers'],
                name: viewModel.tableData['table_name'] ?? "",
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                widgetType: viewModel.tableData['chart_type'] ?? "data_table",
              ),
          ],
        ),
      ),
    );
  }

  @override
  DataViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DataViewModel();

  @override
  void onViewModelReady(DataViewModel viewModel) {
    viewModel.getData();
    super.onViewModelReady(viewModel);
  }

  @override
  bool get disposeViewModel => false;
}
