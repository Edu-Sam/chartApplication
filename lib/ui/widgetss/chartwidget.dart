import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ChartWidgetView extends StatelessWidget {
  const ChartWidgetView({
    Key? key,
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
    this.tableData,
    this.tableHeaders,
  }) : super(key: key);

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
  final List? tableData;
  final List? tableHeaders;

  @override
  Widget build(BuildContext context) {
    Widget output = const SizedBox();

    switch (chartType) {
      case "line_chart":
        output = SfCartesianChart(
          primaryXAxis: categoryXAxis,
          primaryYAxis: categoryYAxis,
          title: chartTitle,
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets.length,
            (index) => LineSeries(
              dataSource: dataSets[index],
              xValueMapper: (datum, _) => extractValue(datum, xKey),
              yValueMapper: (datum, _) => extractValue(datum, yKey),
              name: names[index],
              dataLabelSettings: dataLabelSettings,
            ),
          ),
        );
        break;

      case "pie_chart":
        output = SfCircularChart(
          title: chartTitle,
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: List.generate(
            dataSets.length,
            (index) => PieSeries(
              dataSource: dataSets[index],
              xValueMapper: (datum, _) => extractValue(datum, xKey),
              yValueMapper: (datum, _) => extractValue(datum, yKey),
              name: names[index],
            ),
          ),
        );
        break;

      case "spark_line":
        output = SfSparkLineChart.custom(
          trackball: sparkChartTrackball,
          marker: sparkChartMarker,
          labelDisplayMode: SparkChartLabelDisplayMode.all,
          xValueMapper: (int index) => dataSets[index][0][xKey],
          yValueMapper: (int index) => dataSets[index][0][yKey],
          dataCount: dataSets.length,
        );
        break;

      case "pyramid_chart":
        output = SfPyramidChart(
          title: chartTitle,
          legend: legend,
          tooltipBehavior: tooltipBehavior,
          series: PyramidSeries(
            dataSource: dataSets,
            xValueMapper: (datum, _) => extractValue(datum, xKey),
            yValueMapper: (datum, _) => extractValue(datum, yKey),
            name: names[0],
          ),
        );
        break;

      case "data_table":
        if (tableHeaders != null && tableData != null) {
          DataSource dataTableSource = DataSource(
            columnHeaders: tableHeaders!,
            dataSource: tableData!,
          );
          output = Column(
            children: List.generate(
              dataSets.length,
              (index) => SfDataGrid(
                source: dataTableSource,
                columns: [],
              ),
            ),
          );
        } else {
          output = const SizedBox();
        }
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
}

class DataSource extends DataGridSource {
  DataSource({required List dataSource, required List columnHeaders}) {
    _dataSource = dataSource
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: columnHeaders
                .map<DataGridCell>(
                  (header) =>
                      DataGridCell(columnName: header, value: e[header]),
                )
                .toList(),
          ),
        )
        .toList();
  }

  List<DataGridRow> _dataSource = [];

  @override
  List<DataGridRow> get rows => _dataSource;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>(
        (dataGridCell) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(dataGridCell.value.toString()),
          );
        },
      ).toList(),
    );
  }
}
