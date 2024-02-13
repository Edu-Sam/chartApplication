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
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(),
              child: const Text('Get Data from random url'),
            ),
            viewModel.isFetching
                ? Center(child: const CircularProgressIndicator())
                : Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        // ---------  Line Chart Widget ------------------ //
                        if (viewModel.chartData != {} ||
                            viewModel.chartData.isNotEmpty)
                          if (!viewModel.isFetching)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: ChartWidgetView(
                                dataSets: viewModel.chartData['datasets'],
                                xKey: viewModel.chartData['x_axis_key'],
                                yKey: viewModel.chartData['y_axis_key'],
                                name: viewModel.chartData['chart_name'] ?? "",
                                dataLabelSettings:
                                    const DataLabelSettings(isVisible: true),
                                widgetType: viewModel.chartData['chart_type'] ??
                                    "line_chart",
                              ),
                            ),
                        if (viewModel.chartData != {} ||
                            viewModel.chartData.isNotEmpty)
                          if (!viewModel.isFetching)
                            // ---------  Spark Line Chart Widget ------------------ //
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: ChartWidgetView(
                                dataSets: viewModel.chartData['datasets'],
                                name: viewModel.chartData['chart_name'] ?? "",
                                dataLabelSettings:
                                    const DataLabelSettings(isVisible: true),
                                widgetType: "spark_line",
                              ),
                            ),
                        if (viewModel.tableData != {} ||
                            viewModel.tableData.isNotEmpty)
                          // ---------  DataTable Widget ------------------ //
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: ChartWidgetView(
                              tableData: viewModel.tableData['data'],
                              tableHeaders:
                                  viewModel.tableData['table_headers'],
                              name: viewModel.tableData['table_name'] ?? "",
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: true),
                              widgetType: viewModel.tableData['chart_type'] ??
                                  "data_table",
                            ),
                          ),
                      ],
                    ),
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
