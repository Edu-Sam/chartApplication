import 'package:flutter/material.dart';
import 'package:my_chart_app/ui/views/test.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'data_table_viewmodel.dart';

class DataTableView extends StatelessWidget {
  const DataTableView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => DataTableViewModel(),
        onViewModelReady: (viewModel) {
          viewModel.initEmployees();
        },
        disposeViewModel: false,
        builder: (context, model, child) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const Text('Example data grid'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestPage(),
                        ),
                      );
                    },
                    child: const Text("press me"),
                  ),
                  const SizedBox(height: 20),
                  SfCircularChart(
                    series: <CircularSeries>[
                      PieSeries<ChartData, String>(
                        dataSource: pieData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SfDataGrid(
                      source: model.employeeDataSource,
                      columns: [
                        GridColumn(
                          columnName: 'id',
                          label: Container(
                            padding: const EdgeInsets.all(16.0),
                            alignment: Alignment.centerRight,
                            child: const Text(
                              'ID',
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'name',
                          label: Container(
                            padding: const EdgeInsets.all(16.0),
                            alignment: Alignment.centerLeft,
                            child: const Text('Name'),
                          ),
                        ),
                        GridColumn(
                          columnName: 'designation',
                          width: 120,
                          label: Container(
                            padding: const EdgeInsets.all(16.0),
                            alignment: Alignment.centerLeft,
                            child: const Text('Designation'),
                          ),
                        ),
                        GridColumn(
                          columnName: 'salary',
                          label: Container(
                            padding: const EdgeInsets.all(16.0),
                            alignment: Alignment.centerRight,
                            child: const Text('Salary'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text('data')
                ],
              ),
            ),
          );
        });
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}

final List<ChartData> pieData = [
  ChartData('A', 25),
  ChartData('B', 35),
  ChartData('C', 40),
];
