import 'package:flutter/material.dart';
import 'package:my_chart_app/ui/widgetss/chartwidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class TestPage extends StatefulWidget {
  const TestPage({
    super.key,
  });

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Map apiData = {
    "charts": {
      "type": "line_chart",
      "chart_type": "line_chart",
      "x_axis_key": "month",
      "y_axis_key": "sales",
      "chart_name": "demo",
              "chart_data": [
            {
                "month": "Jan",
                "sales": 200
            },
            {
                "month": "Feb",
                "sales": 215
            },
            {
                "month": "Mar",
                "sales": 180
            },
            {
                "month": "Apr",
                "sales": 240
            },
            {
                "month": "May",
                "sales": 225
            },
            {
                "month": "Jun",
                "sales": 210
            },
            {
                "month": "Jul",
                "sales": 230
            },
            {
                "month": "Aug",
                "sales": 220
            },
            {
                "month": "Sep",
                "sales": 210
            },
            {
                "month": "Oct",
                "sales": 205
            },
            {
                "month": "Nov",
                "sales": 215
            },
            {
                "month": "Dec",
                "sales": 230
            }
        ],
        "chart_data_2": [
            {
                "month": "Jan",
                "sales": 231
            },
            {
                "month": "Feb",
                "sales": 221
            },
            {
                "month": "Mar",
                "sales": 345
            },
            {
                "month": "Apr",
                "sales": 112
            },
            {
                "month": "May",
                "sales": 453
            },
            {
                "month": "Jun",
                "sales": 312
            },
            {
                "month": "Jul",
                "sales": 541
            },
            {
                "month": "Aug",
                "sales": 99
            },
            {
                "month": "Sep",
                "sales": 123
            },
            {
                "month": "Oct",
                "sales": 763
            },
            {
                "month": "Nov",
                "sales": 312
            },
            {
                "month": "Dec",
                "sales": 443
            }
        ],
      "datasets": [
        {
          "label": "Dataset 1",
          "data": [
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
          "lineColor": "rgb(255, 99, 132)"
        },
        {
          "label": "Dataset 2",
          "data": [
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
          "lineColor": "rgb(54, 162, 235)"
        }
      ],
      "x_axis_data": {"name": "", "title": "", "decoration": ""},
      "y_axis_data": {"name": "", "title": "", "decoration": ""}
    },
    "dataGrid": {
      "chart_type": "data_table",
      "table_name":"Demo data table",
      "table_headers": [
        "id",
        "name",
        "position",
        "salary",
        "department",
        "hire_date"
      ],
      "dataset":{},
      "data": [
        {
          "id": 10001,
          "name": "James",
          "position": "Project Lead",
          "salary": 20000,
          "department": "Engineering",
          "hire_date": "2020-05-15"
        },
        {
          "id": 10002,
          "name": "Kathryn",
          "position": "Manager",
          "salary": 30000,
          "department": "Management",
          "hire_date": "2019-10-20"
        },
        {
          "id": 10003,
          "name": "Lara",
          "position": "Developer",
          "salary": 15000,
          "department": "Engineering",
          "hire_date": "2021-03-12"
        },
        {
          "id": 10004,
          "name": "Michael",
          "position": "Designer",
          "salary": 15000,
          "department": "Design",
          "hire_date": "2018-07-08"
        },
        {
          "id": 10005,
          "name": "Martin",
          "position": "Developer",
          "salary": 15000,
          "department": "Engineering",
          "hire_date": "2022-01-30"
        },
        {
          "id": 10006,
          "name": "Newberry",
          "position": "Developer",
          "salary": 15000,
          "department": "Engineering",
          "hire_date": "2020-09-25"
        },
        {
          "id": 10007,
          "name": "Balnc",
          "position": "Developer",
          "salary": 15000,
          "department": "Engineering",
          "hire_date": "2019-12-10"
        },
        {
          "id": 10008,
          "name": "Perry",
          "position": "Developer",
          "salary": 15000,
          "department": "Engineering",
          "hire_date": "2020-02-28"
        },
        {
          "id": 10009,
          "name": "Gable",
          "position": "Developer",
          "salary": 15000,
          "department": "Engineering",
          "hire_date": "2021-07-05"
        },
        {
          "id": 10010,
          "name": "Grimes",
          "position": "Developer",
          "salary": 15000,
          "department": "Engineering",
          "hire_date": "2019-04-14"
        },
        {
          "id": 10011,
          "name": "John",
          "position": "Manager",
          "salary": 30000,
          "department": "Management",
          "hire_date": "2018-02-17"
        },
        {
          "id": 10012,
          "name": "Emily",
          "position": "Designer",
          "salary": 25000,
          "department": "Design",
          "hire_date": "2017-09-03"
        },
        {
          "id": 10013,
          "name": "David",
          "position": "Architect",
          "salary": 35000,
          "department": "Engineering",
          "hire_date": "2016-11-22"
        },
        {
          "id": 10014,
          "name": "Sarah",
          "position": "QA Engineer",
          "salary": 18000,
          "department": "Quality Assurance",
          "hire_date": "2019-06-28"
        },
        {
          "id": 10015,
          "name": "Anna",
          "position": "Data Analyst",
          "salary": 20000,
          "department": "Data Analytics",
          "hire_date": "2020-08-15"
        },
        {
          "id": 10016,
          "name": "Robert",
          "position": "System Administrator",
          "salary": 22000,
          "department": "Information Technology",
          "hire_date": "2018-04-10"
        },
        {
          "id": 10017,
          "name": "Daniel",
          "position": "Network Engineer",
          "salary": 25000,
          "department": "Information Technology",
          "hire_date": "2017-12-05"
        },
        {
          "id": 10018,
          "name": "Jessica",
          "position": "UX Designer",
          "salary": 28000,
          "department": "Design",
          "hire_date": "2019-01-18"
        },
        {
          "id": 10019,
          "name": "Thomas",
          "position": "Database Administrator",
          "salary": 27000,
          "department": "Information Technology",
          "hire_date": "2019-11-30"
        },
        {
          "id": 10020,
          "name": "Elizabeth",
          "position": "Technical Writer",
          "salary": 21000,
          "department": "Documentation",
          "hire_date": "2021-02-25"
        }
      ]
    }
  };

  @override
  Widget build(BuildContext context) {
    var charts = apiData['charts'];
    var dataTable = apiData['dataGrid'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter chart'),
      ),
      body: ListView(
        children: [
          ChartWidgetView(
            dataSets: charts['datasets'],
            xKey: charts['x_axis_key'],
            yKey: charts['y_axis_key'],
            name: charts['chart_name'],
            categoryXAxis: CategoryAxis(
              name: charts['name'],
              title: AxisTitle(text: charts['title']),
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
            widgetType: charts['chart_type'],
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: charts['datasets'].map<Widget>((dataset) {
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
                    xValueMapper: (int index) =>
                        dataset['data'][index]['month'],
                    yValueMapper: (int index) =>
                        dataset['data'][index]['sales'],
                    dataCount: dataset['data'].length,
                  ),
                ),
              );
            }).toList(),
          ),
          ChartWidgetView(
            tableData: dataTable['data'],
            tableHeaders: dataTable['table_headers'],
            name: dataTable['table_name'],
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            widgetType: dataTable['chart_type'],
          ),
        ],
      ),
    );
  }
}
