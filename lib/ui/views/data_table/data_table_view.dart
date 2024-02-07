import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
        builder: (context, model, child) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Text('Example data grid'),
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
                  Text('data')
                ],
              ),
            ),
          );
        });
  }
}
