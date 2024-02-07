import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'data_table_viewmodel.dart';

// class DataTableView extends StackedView<DataTableViewModel> {
//   const DataTableView({Key? key}) : super(key: key);

//   @override
//   Widget builder(
//     BuildContext context,
//     DataTableViewModel viewModel,
//     Widget? child,
//   ) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: Container(
//         padding: const EdgeInsets.only(left: 25.0, right: 25.0),
//       ),
//     );
//   }

//   @override
//   DataTableViewModel viewModelBuilder(
//     BuildContext context,
//   ) =>
//       DataTableViewModel();
// }

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
            body: Center(
              child: Expanded(
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
            ),
          );
        });
  }
}
