import 'package:flutter/material.dart';
import 'package:my_chart_app/common/helpers.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartWidgetView extends StatelessWidget {
  const ChartWidgetView({
    Key? key,
    this.categoryXAxis,
    this.categoryYAxis,
    this.numericXAxis,
    this.numericyAxis,
    this.dateTimeXAxis,
    this.dateTimeyAxis,
    this.dateTimeCategoryXAxis,
    this.dateTimeCategoryYAxis,
    this.chartTitle,
    this.legend,
    this.dataSets,
    this.xKey,
    this.yKey,
    this.dataLabelSettings,
    required this.widgetType,
    this.tooltipBehavior,
    this.markerSettings,
    this.sparkChartMarker,
    this.sparkChartTrackball,
    required this.name,
    this.xAxistTitle,
    this.yAxistTitle,
    this.chartSets,
    this.xAxisTitleTextStyle,
    this.yAxisTitleTextStyle,
    this.xAxisLine,
    this.yAxisLine,
    this.chartTitleStyle,
  }) : super(key: key);

  final CategoryAxis? categoryXAxis;
  final CategoryAxis? categoryYAxis;
  final NumericAxis? numericXAxis, numericyAxis;
  final DateTimeAxis? dateTimeXAxis;
  final DateTimeAxis? dateTimeyAxis;
  final DateTimeCategoryAxis? dateTimeCategoryXAxis;
  final DateTimeCategoryAxis? dateTimeCategoryYAxis;
  final ChartTitle? chartTitle;
  final Legend? legend;
  final List? dataSets;
  final String? xKey;
  final String? yKey;
  final String name;
  final DataLabelSettings? dataLabelSettings;
  final String widgetType;
  final TooltipBehavior? tooltipBehavior;
  final MarkerSettings? markerSettings;
  final SparkChartMarker? sparkChartMarker;
  final SparkChartTrackball? sparkChartTrackball;
  final String? xAxistTitle;
  final String? yAxistTitle;
  final List<List>? chartSets;
  final TextStyle? xAxisTitleTextStyle;
  final TextStyle? yAxisTitleTextStyle;
  final TextStyle? chartTitleStyle;
  final AxisLine? xAxisLine;
  final AxisLine? yAxisLine;

  @override
  Widget build(BuildContext context) {
    Widget output = const SizedBox();

    CategoryAxis xCategoryAxis = categoryXAxis ??
        CategoryAxis(
          name: xAxistTitle,
          title: xAxistTitle != null
              ? AxisTitle(
                  text: xAxistTitle ?? "",
                  textStyle: xAxisTitleTextStyle,
                )
              : null,
          axisLine: xAxisLine ??
              const AxisLine(
                color: Colors.black,
              ),
          labelPlacement: LabelPlacement.onTicks,
          interval: 2,
          //  arrangeByIndex: true
        );
    CategoryAxis yCategoryAxis = categoryYAxis ??
        CategoryAxis(
          name: yAxistTitle,
          title: yAxistTitle != null
              ? AxisTitle(
                  text: yAxistTitle ?? "",
                  textStyle: yAxisTitleTextStyle,
                )
              : null,
          axisLine: yAxisLine ??
              const AxisLine(
                color: Colors.black,
              ),
          labelPlacement: LabelPlacement.onTicks,
          interval: 2,
          //  arrangeByIndex: true
        );

    Legend chartLegend = legend ?? const Legend();

    switch (widgetType) {
      case "line_chart":
        output = SfCartesianChart(
          primaryXAxis: xCategoryAxis,
          primaryYAxis: yCategoryAxis,
          title: chartTitle ?? ChartTitle(text: "Line Chart"),
          legend: chartLegend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets!.length,
            (index) => LineSeries(
              dataSource: List.from(dataSets![index]['data']),
              xValueMapper: (datum, _) => extractValue(datum, xKey!),
              yValueMapper: (datum, _) => extractValue(datum, yKey!),
              name: name,
              dataLabelSettings: dataLabelSettings,
              color: getColorFromString(dataSets![index]['lineColor']),
            ),
          ),
        );
        break;

      case "column_chart":
        output = SfCartesianChart(
          primaryXAxis: xCategoryAxis,
          primaryYAxis: yCategoryAxis,
          title: chartTitle ?? ChartTitle(text: "Column Chart"),
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets!.length,
            (index) => ColumnSeries(
              dataSource: List.from(dataSets![index]['data']),
              xValueMapper: (datum, _) => extractValue(datum, xKey!),
              yValueMapper: (datum, _) => extractValue(datum, yKey!),
              name: name,
              dataLabelSettings: dataLabelSettings,
              color: getColorFromString(dataSets![index]['lineColor']),
            ),
          ),
        );
        break;

      case "bar_chart":
        output = SfCartesianChart(
          primaryXAxis: xCategoryAxis,
          primaryYAxis: yCategoryAxis,
          title: chartTitle ?? ChartTitle(text: "Bar Chart"),
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets!.length,
            (index) => BarSeries(
              dataSource: List.from(dataSets![index]['data']),
              xValueMapper: (datum, _) => extractValue(datum, xKey!),
              yValueMapper: (datum, _) => extractValue(datum, yKey!),
              name: name,
              dataLabelSettings: dataLabelSettings,
              color: getColorFromString(dataSets![index]['lineColor']),
            ),
          ),
        );
        break;

      case "area_chart":
        final List<Color> color = <Color>[];
        color.add(Colors.blue[50]!);
        color.add(Colors.blue[200]!);
        color.add(Colors.blue);

        final List<double> stops = <double>[];
        stops.add(0.0);
        stops.add(0.5);
        stops.add(1.0);

        // final LinearGradient gradientColors =
        //     LinearGradient(colors: color, stops: stops);
        output = SfCartesianChart(
          primaryXAxis: xCategoryAxis,
          primaryYAxis: yCategoryAxis,
          title: chartTitle ?? ChartTitle(text: "Area Chart"),
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets!.length,
            (index) => AreaSeries(
              dataSource: List.from(dataSets![index]['data']),
              xValueMapper: (datum, _) => extractValue(datum, xKey!),
              yValueMapper: (datum, _) => extractValue(datum, yKey!),
              name: name,
              dataLabelSettings: dataLabelSettings,
              color: getColorFromString(dataSets![index]['lineColor']),
              //  gradient: gradientColors
            ),
          ),
        );
        break;

      case "spline_chart":
        output = SfCartesianChart(
          primaryXAxis: xCategoryAxis,
          primaryYAxis: yCategoryAxis,
          title: chartTitle ?? ChartTitle(text: "Spline Chart"),
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets!.length,
            (index) => SplineSeries(
              dataSource: List.from(dataSets![index]['data']),
              xValueMapper: (datum, _) => extractValue(datum, xKey!),
              yValueMapper: (datum, _) => extractValue(datum, yKey!),
              name: name,
              dataLabelSettings: dataLabelSettings,
              color: getColorFromString(dataSets![index]['lineColor']),
            ),
          ),
        );
        break;

      case "step_line_chart":
        output = SfCartesianChart(
          primaryXAxis: xCategoryAxis,
          primaryYAxis: yCategoryAxis,
          title: chartTitle ?? ChartTitle(text: "Step Line Chart"),
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets!.length,
            (index) => StepLineSeries(
              dataSource: List.from(dataSets![index]['data']),
              // dashArray: <double>[5, 5],
              xValueMapper: (datum, _) => extractValue(datum, xKey!),
              yValueMapper: (datum, _) => extractValue(datum, yKey!),
              name: name,
              dataLabelSettings: dataLabelSettings,
              color: getColorFromString(dataSets![index]['lineColor']),
            ),
          ),
        );
        break;

      case "fast_line_chart":
        output = SfCartesianChart(
          primaryXAxis: xCategoryAxis,
          primaryYAxis: yCategoryAxis,
          title: chartTitle ?? ChartTitle(text: "Fast Line Chart"),
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets!.length,
            (index) => FastLineSeries(
              dataSource: List.from(dataSets![index]['data']),
              xValueMapper: (datum, _) => extractValue(datum, xKey!),
              yValueMapper: (datum, _) => extractValue(datum, yKey!),
              name: name,
              dataLabelSettings: dataLabelSettings,
              color: getColorFromString(dataSets![index]['lineColor']),
            ),
          ),
        );
        break;

      case "stacked_line_chart":
        output = SfCartesianChart(
          primaryXAxis: xCategoryAxis,
          primaryYAxis: yCategoryAxis,
          title: chartTitle ?? ChartTitle(text: "Stacked Line Chart"),
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets!.length,
            (index) => StackedLineSeries(
              dataSource: List.from(dataSets![index]['data']),
              xValueMapper: (datum, _) => extractValue(datum, xKey!),
              yValueMapper: (datum, _) => extractValue(datum, yKey!),
              name: name,
              dataLabelSettings: dataLabelSettings,
              color: getColorFromString(dataSets![index]['lineColor']),
            ),
          ),
        );
        break;

      case "Stacked_area_chart":
        output = SfCartesianChart(
          primaryXAxis: xCategoryAxis,
          primaryYAxis: yCategoryAxis,
          title: chartTitle ?? ChartTitle(text: "Stacked Area Chart"),
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets!.length,
            (index) => StackedAreaSeries(
              dataSource: List.from(dataSets![index]['data']),
              xValueMapper: (datum, _) => extractValue(datum, xKey!),
              yValueMapper: (datum, _) => extractValue(datum, yKey!),
              name: name,
              dataLabelSettings: dataLabelSettings ??
                  const DataLabelSettings(
                    isVisible: true,
                    // showCumulativeValues: true,
                    useSeriesColor: true,
                  ),
              color: getColorFromString(dataSets![index]['lineColor']),
            ),
          ),
        );
        break;

      case "Stacked_column_chart":
        output = SfCartesianChart(
          primaryXAxis: xCategoryAxis,
          primaryYAxis: yCategoryAxis,
          title: chartTitle ?? ChartTitle(text: "Stacked Column Chart"),
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets!.length,
            (index) => StackedColumnSeries(
              dataSource: List.from(dataSets![index]['data']),
              xValueMapper: (datum, _) => extractValue(datum, xKey!),
              yValueMapper: (datum, _) => extractValue(datum, yKey!),
              name: name,
              dataLabelSettings: dataLabelSettings,
              color: getColorFromString(dataSets![index]['lineColor']),
            ),
          ),
        );
        break;

      case "Stacked_bar_chart":
        output = SfCartesianChart(
          primaryXAxis: xCategoryAxis,
          primaryYAxis: yCategoryAxis,
          title: chartTitle ?? ChartTitle(text: "Stacked Bar Chart"),
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets!.length,
            (index) => StackedBarSeries(
              dataSource: List.from(dataSets![index]['data']),
              xValueMapper: (datum, _) => extractValue(datum, xKey!),
              yValueMapper: (datum, _) => extractValue(datum, yKey!),
              name: name,
              dataLabelSettings: dataLabelSettings,
              color: getColorFromString(dataSets![index]['lineColor']),
            ),
          ),
        );
        break;

      case "bubble_chart":
        output = SfCartesianChart(
          primaryXAxis: xCategoryAxis,
          primaryYAxis: yCategoryAxis,
          title: chartTitle ?? ChartTitle(text: "Bubble Chart"),
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets!.length,
            (index) => BubbleSeries(
              dataSource: List.from(dataSets![index]['data']),
              sizeValueMapper: (datum, _) =>
                  extractSize(dataSets![index]['data'], datum),
              xValueMapper: (datum, _) => extractValue(datum, xKey!),
              yValueMapper: (datum, _) => extractValue(datum, yKey!),
              name: name,
              dataLabelSettings: dataLabelSettings,
              color: getColorFromString(dataSets![index]['lineColor']),
            ),
          ),
        );
        break;

      case "scatter_chart":
        output = SfCartesianChart(
          primaryXAxis: xCategoryAxis,
          primaryYAxis: yCategoryAxis,
          title: chartTitle ?? ChartTitle(text: "Scatter Chart"),
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets!.length,
            (index) => ScatterSeries(
                dataSource: List.from(dataSets![index]['data']),
                xValueMapper: (datum, _) => extractValue(datum, xKey!),
                yValueMapper: (datum, _) => extractValue(datum, yKey!),
                name: name,
                dataLabelSettings: dataLabelSettings,
                color: getColorFromString(dataSets![index]['lineColor']),
                markerSettings: const MarkerSettings(
                    height: 15,
                    width: 15,
                    // Scatter will render in diamond shape
                    shape: DataMarkerType.diamond)),
          ),
        );
        break;

      case "pie_chart":
        output = SfCircularChart(
          title: chartTitle ?? ChartTitle(text: "Pie Chart"),
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets!.length,
            (index) => PieSeries(
                dataSource: dataSets![index]["data"],
                xValueMapper: (datum, _) => extractValue(datum, xKey!),
                yValueMapper: (datum, _) => extractValue(datum, yKey!),
                name: dataSets![index]["label"],
                explode: true,
                // All the segments will be exploded
                explodeAll: true),
          ),
        );
        break;

      case "doughnut_chart":
        output = SfCircularChart(
          title: chartTitle ?? ChartTitle(text: "Doughnut Chart"),
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets!.length,
            (index) => DoughnutSeries(
                dataSource: dataSets![index]["data"],
                xValueMapper: (datum, _) => extractValue(datum, xKey!),
                yValueMapper: (datum, _) => extractValue(datum, yKey!),
                name: dataSets![index]["label"],
                explode: true,
                // All the segments will be exploded
                explodeAll: true),
          ),
        );
        break;

      case "radial_bar_chart":
        output = SfCircularChart(
          title: chartTitle ?? ChartTitle(text: "Radial Bar Chart"),
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets!.length,
            (index) => RadialBarSeries(
              dataSource: dataSets![index]["data"],
              xValueMapper: (datum, _) => extractValue(datum, xKey!),
              yValueMapper: (datum, _) => extractValue(datum, yKey!),
              name: dataSets![index]["label"],
            ),
          ),
        );
        break;

      case "spark_line":
        if (dataSets == null || dataSets!.isEmpty) {
          output = const SizedBox();
        }
        output = ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: dataSets!.map<Widget>((dataset) {
            return SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SfSparkLineChart.custom(
                  trackball: const SparkChartTrackball(
                      activationMode: SparkChartActivationMode.tap),
                  marker: const SparkChartMarker(
                      displayMode: SparkChartMarkerDisplayMode.all),
                  labelDisplayMode: SparkChartLabelDisplayMode.all,
                  xValueMapper: (int index) => dataset['data'][index]['month'],
                  yValueMapper: (int index) => dataset['data'][index]['sales'],
                  dataCount: dataset['data'].length,
                ),
              ),
            );
          }).toList(),
        );
        break;

      case "pyramid_chart":
        output = SfPyramidChart(
          title: chartTitle,
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: PyramidSeries(
            dataSource: dataSets![0]["data"],
            xValueMapper: (datum, _) => extractValue(datum, xKey!),
            yValueMapper: (datum, _) => extractValue(datum, yKey!),
            name: dataSets![0]["label"],
          ),
        );
        break;

      default:
        output = Container();
        break;
    }
    return output;
  }

  dynamic extractValue(Map datum, String key) {
    final dynamic value = datum[key];
    if (value is num) {
      return value.toDouble();
    } else if (value is String) {
      return value;
    } else {
      throw Exception('Invalid data: $value');
    }
  }

  double extractSize(List data, Map datum) {
    double totalSales = 0;
    String? numericKey;

    var size = 1.0;

    for (var entry in data) {
      entry.forEach((key, value) {
        if (value is num) {
          totalSales += value;
        }
      });
    }

    datum.forEach((key, value) {
      if (value is num) {
        numericKey = key;
      }
    });

    if (numericKey != null) {
      size = (datum[numericKey] / totalSales);
    } else {
      print('No numeric value found in the map.');
    }
    return size;
  }
}
