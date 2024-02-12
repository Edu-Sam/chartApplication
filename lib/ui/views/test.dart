import 'package:flutter/material.dart';
import 'package:my_chart_app/ui/widgetss/chartwidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class TestPage extends StatefulWidget {
  const TestPage(
      {super.key,
      required this.categoryXAxis,
      required this.categoryYAxis,
      required this.chartTitle,
      required this.legend});

  final CategoryAxis categoryXAxis;
  final CategoryAxis categoryYAxis;
  final ChartTitle chartTitle;
  final Legend legend;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  Map apiData = {
    "chart_type": "line_chart",
    "x_axis_key": "month",
    "y_axis_key": "sales",
    "chart_name": "demo",
    "datas": [],
    "chart_data": [
      {"month": "Jan", "sales": 200},
      {"month": "Feb", "sales": 215},
      {"month": "Mar", "sales": 180},
      {"month": "Apr", "sales": 240},
      {"month": "May", "sales": 225},
      {"month": "Jun", "sales": 210},
      {"month": "Jul", "sales": 230},
      {"month": "Aug", "sales": 220},
      {"month": "Sep", "sales": 210},
      {"month": "Oct", "sales": 205},
      {"month": "Nov", "sales": 215},
      {"month": "Dec", "sales": 230}
    ],
    "chart_data_2": [
      {"month": "Jan", "sales": 231},
      {"month": "Feb", "sales": 221},
      {"month": "Mar", "sales": 345},
      {"month": "Apr", "sales": 112},
      {"month": "May", "sales": 453},
      {"month": "Jun", "sales": 312},
      {"month": "Jul", "sales": 541},
      {"month": "Aug", "sales": 99},
      {"month": "Sep", "sales": 123},
      {"month": "Oct", "sales": 763},
      {"month": "Nov", "sales": 312},
      {"month": "Dec", "sales": 443}
    ],
    "x_axis_data": {
      "name": "",
      "title": "",
      "decoration": "",
    },
    "y_axis_data": {
      "name": "",
      "title": "",
      "decoration": "",
    },
  };

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter chart'),
      ),
      body: ListView(
        children: [
          ChartWidgetView(
            dataSets: [apiData['chart_data'], apiData['chart_data_2']],
            xKey: apiData['x_axis_key'],
            yKey: apiData['y_axis_key'],
            names: [apiData['chart_name'], 'chart_data_2_name'],
            categoryXAxis: CategoryAxis(
              name: apiData['x_axis_data']['name'],
              title: AxisTitle(text: apiData['x_axis_data']['title']),
              axisLine: const AxisLine(
                color: Colors.red,
                width: 2,
              ),
            ),
            categoryYAxis: CategoryAxis(
              name: 'nsnkjs',
              title: AxisTitle(text: 'cjsc3uybewhbwjbjs'),
              axisLine: const AxisLine(
                color: Colors.green,
                width: 2,
              ),
            ),
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            chartType: apiData['chart_type'],
          ),
    // ChartWidgetView(
    //   categoryXAxis: chartInfo.categoryXAxis,
    //   categoryYAxis: chartInfo.categoryYAxis,
    //   dataSets: chartInfo.dataSets,
    //   xKey: chartInfo.xKey,
    //   yKey: chartInfo.yKey,
    //   names: chartInfo.names,
    //   dataLabelSettings: chartInfo.dataLabelSettings,
    //   chartType: chartInfo.chartType,
    // ),
          SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
        //Initialize the spark charts widget
              child: SfSparkLineChart.custom(
          //Enable the trackball
                trackball: const SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap),
          //Enable marker
                marker: const SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all),
          //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                xValueMapper: (int index) => data[index].year,
                yValueMapper: (int index) => data[index].sales,
                dataCount: 5,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

// case "pie_chart":
//   output = SfCircularChart(
//     title: chartTitle,
//     legend: legend,
//     tooltipBehavior: tooltipBehavior,
//     series: <CircularSeries>[
//       PieSeries(
//         dataSource: data,
//         xValueMapper: (datum, _) => extractValue(datum, xKey),
//         yValueMapper: (datum, _) => extractValue(datum, yKey),
//         name: name,
//       )
//     ],
//   );
//   break;

// case "spark_line":
//   output = SfSparkLineChart.custom(
//     trackball: sparkChartTrackball,
//     marker: sparkChartMarker,
//     labelDisplayMode: SparkChartLabelDisplayMode.all,
//     xValueMapper: (int index) => data[index][0][xKey],
//     yValueMapper: (int index) => data[index][0][yKey],
//     dataCount: data.length,
//   );

// case "pyramid_chart":
//   output = SfPyramidChart(
//     title: chartTitle,
//     legend: legend,
//     tooltipBehavior: tooltipBehavior,
//     series: PyramidSeries(
//       dataSource: data,
//       xValueMapper: (datum, _) => extractValue(datum, xKey),
//       yValueMapper: (datum, _) => extractValue(datum, yKey),
//       name: name,
//     ),
//   );
//   break;