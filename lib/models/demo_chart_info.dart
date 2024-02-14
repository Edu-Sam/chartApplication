import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartInfo {
  final CategoryAxis? categoryXAxis;
  final CategoryAxis? categoryYAxis;
  final ChartTitle? chartTitle;
  final Legend? legend;
  final List<List<Map<String, dynamic>>> dataSets;
  final String xKey;
  final String yKey;
  final List<String> names;
  final DataLabelSettings? dataLabelSettings;
  final String chartType;
  final TooltipBehavior? tooltipBehavior;
  final MarkerSettings? markerSettings;
  final SparkChartMarker? sparkChartMarker;
  final SparkChartTrackball? sparkChartTrackball;

  ChartInfo({
    this.categoryXAxis,
    this.categoryYAxis,
    this.chartTitle,
    this.legend,
    required this.dataSets,
    required this.xKey,
    required this.yKey,
    required this.names,
    this.dataLabelSettings,
    required this.chartType,
    this.tooltipBehavior,
    this.markerSettings,
    this.sparkChartMarker,
    this.sparkChartTrackball,
  });

  factory ChartInfo.fromJson(Map<String, dynamic> json) {
    return ChartInfo(
      categoryXAxis: json['categoryXAxis'] as CategoryAxis?,
      categoryYAxis: json['categoryYAxis'] as CategoryAxis?,
      chartTitle: json['chartTitle'] as ChartTitle?,
      legend: json['legend'] as Legend?,
      dataSets: (json['dataSets'] as List?)!
          .map((e) => e as List<Map<String, dynamic>>)
          .toList(),
      xKey: json['xKey'] as String,
      yKey: json['yKey'] as String,
      names: (json['names'] as List).map((e) => e as String).toList(),
      dataLabelSettings: json['dataLabelSettings'] as DataLabelSettings?,
      chartType: json['chartType'] as String,
      tooltipBehavior: json['tooltipBehavior'] as TooltipBehavior?,
      markerSettings: json['markerSettings'] as MarkerSettings?,
      sparkChartMarker: json['sparkChartMarker'] as SparkChartMarker?,
      sparkChartTrackball: json['sparkChartTrackball'] as SparkChartTrackball?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryXAxis': categoryXAxis,
      'categoryYAxis': categoryYAxis,
      'chartTitle': chartTitle,
      'legend': legend,
      'dataSets': dataSets,
      'xKey': xKey,
      'yKey': yKey,
      'names': names,
      'dataLabelSettings': dataLabelSettings,
      'chartType': chartType,
      'tooltipBehavior': tooltipBehavior,
      'markerSettings': markerSettings,
      'sparkChartMarker': sparkChartMarker,
      'sparkChartTrackball': sparkChartTrackball,
    };
  }
}

///
/// Implemention test {failed}

// Extracting data from API
// List<List<Map<String, dynamic>>> dataSets = [
//   List<Map<String, dynamic>>.from(apiData['chart_data']),
//   List<Map<String, dynamic>>.from(apiData['chart_data_2'])
// ];

// String xKey = apiData['x_axis_key'];
// String yKey = apiData['y_axis_key'];
// List<String> names = [apiData['chart_name'], 'chart_data_2_name'];

// CategoryAxis categoryXAxis = CategoryAxis(
//   name: apiData['x_axis_data']['name'],
//   title: AxisTitle(text: apiData['x_axis_data']['title']),
//   axisLine: const AxisLine(
//     color: Colors.red,
//     width: 2,
//   ),
// );

// CategoryAxis categoryYAxis = CategoryAxis(
//   name: apiData['y_axis_data']['name'],
//   title: AxisTitle(text: apiData['y_axis_data']['title']),
//   axisLine: const AxisLine(
//     color: Colors.green,
//     width: 2,
//   ),
// );

// DataLabelSettings dataLabelSettings = const DataLabelSettings(isVisible: true);

// ChartInfo chartInfo = ChartInfo(
//   categoryXAxis: categoryXAxis,
//   categoryYAxis: categoryYAxis,
//   dataSets: dataSets,
//   xKey: xKey,
//   yKey: yKey,
//   names: names,
//   dataLabelSettings: dataLabelSettings,
//   chartType: apiData['chart_type'],
// );
