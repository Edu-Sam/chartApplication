import 'package:flutter/material.dart';
import 'package:my_chart_app/common/helpers.dart';
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
      appBar: AppBar(
        title: const Text(
          "Chart View",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                viewModel.getDataFronUrl('');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('Get Data from random url'),
            ),
            viewModel.isFetching
                ? const Center(child: CircularProgressIndicator())
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
                                categoryXAxis: CategoryAxis(
                                  name: viewModel.chartData['x_axis_data']
                                          ['name'] ??
                                      "",
                                  title: viewModel.chartData['x_axis_data']
                                              ['name'] !=
                                          null
                                      ? AxisTitle(
                                          text:
                                              viewModel.chartData['x_axis_data']
                                                      ['title'] ??
                                                  "",
                                          textStyle: viewModel.chartData[
                                                              'x_axis_data'][
                                                          'axis_title_style'] !=
                                                      null ||
                                                  viewModel.chartData[
                                                              'x_axis_data'][
                                                          'axis_title_style'] !=
                                                      {}
                                              ? convertToTextStyles(viewModel
                                                      .chartData['x_axis_data']
                                                  ['axis_title_style'])
                                              : const TextStyle(),
                                        )
                                      : null,
                                  axisLine: viewModel.chartData['x_axis_data']
                                                  ['axis_line'] !=
                                              null ||
                                          viewModel.chartData['x_axis_data']
                                                  ['axis_line'] !=
                                              {}
                                      ? convertToAxisLine(
                                          viewModel.chartData['x_axis_data']
                                              ['axis_line'])
                                      : const AxisLine(
                                          color: Colors.black,
                                        ),
                                  labelPlacement: LabelPlacement.onTicks,
                                  interval: 2,
                                ),
                                categoryYAxis: CategoryAxis(
                                  name: viewModel.chartData['y_axis_data']
                                          ['name'] ??
                                      "",
                                  title: viewModel.chartData['y_axis_data']
                                              ['name'] !=
                                          null
                                      ? AxisTitle(
                                          text:
                                              viewModel.chartData['y_axis_data']
                                                      ['title'] ??
                                                  "",
                                          textStyle: viewModel.chartData[
                                                              'y_axis_data'][
                                                          'axis_title_style'] !=
                                                      null ||
                                                  viewModel.chartData[
                                                              'y_axis_data'][
                                                          'axis_title_style'] !=
                                                      {}
                                              ? convertToTextStyles(viewModel
                                                      .chartData['y_axis_data']
                                                  ['axis_title_style'])
                                              : const TextStyle(),
                                        )
                                      : null,
                                  axisLine: viewModel.chartData['y_axis_data']
                                                  ['axis_line'] !=
                                              null ||
                                          viewModel.chartData['y_axis_data']
                                                  ['axis_line'] !=
                                              {}
                                      ? convertToAxisLine(
                                          viewModel.chartData['y_axis_data']
                                              ['axis_line'])
                                      : const AxisLine(
                                          color: Colors.black,
                                        ),
                                  labelPlacement: LabelPlacement.onTicks,
                                  interval: 2,
                                  //  arrangeByIndex: true
                                ),
                              ),
                            ),
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
                                widgetType: "column_chart",
                              ),
                            ),
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
                                widgetType: "bar_chart",
                              ),
                            ),
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
                                widgetType: "area_chart",
                              ),
                            ),
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
                                widgetType: "fast_line_chart",
                              ),
                            ),
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
                                widgetType: "step_line_chart",
                              ),
                            ),
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
                                widgetType: "spline_chart",
                              ),
                            ),

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
                                widgetType: "stacked_line_chart",
                              ),
                            ),
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
                                widgetType: "Stacked_bar_chart",
                              ),
                            ),
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
                                widgetType: "Stacked_column_chart",
                              ),
                            ),
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
                                widgetType: "Stacked_area_chart",
                              ),
                            ),

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
                                widgetType: "bubble_chart",
                              ),
                            ),
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
                                widgetType: "scatter_chart",
                              ),
                            ),
                        // ---------  Circular Chart ------------------------//
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
                                widgetType: "pie_chart",
                              ),
                            ),

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
                                widgetType: "doughnut_chart",
                              ),
                            ),

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
                                widgetType: "radial_bar_chart",
                              ),
                            ),
                        // ---------  Spark Line Chart Widget ------------------ //
                        if (viewModel.chartData != {} ||
                            viewModel.chartData.isNotEmpty)
                          if (!viewModel.isFetching)
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
