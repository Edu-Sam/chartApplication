import 'package:flutter/widgets.dart';
import 'package:my_chart_app/models/data_model.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataTableViewModel extends BaseViewModel {
  List<Employee> employees = <Employee>[];

  late EmployeeDataSource _employeeDataSource;
  EmployeeDataSource get employeeDataSource => _employeeDataSource;

  void initEmployees() {
    employees = getEmployees();
    _employeeDataSource = EmployeeDataSource(employees: employees);
    notifyListeners();
  }

  List<Employee> getEmployees() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000),
      Employee(10002, 'Kathryn', 'Manager', 30000),
      Employee(10003, 'Lara', 'Developer', 15000),
      Employee(10004, 'Michael', 'Designer', 15000),
      Employee(10005, 'Martin', 'Developer', 15000),
      Employee(10006, 'Newberry', 'Developer', 15000),
      Employee(10007, 'Balnc', 'Developer', 15000),
      Employee(10008, 'Perry', 'Developer', 15000),
      Employee(10009, 'Gable', 'Developer', 15000),
      Employee(10010, 'Grimes', 'Developer', 15000)
    ];
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<Employee> employees}) {
    _employees = employees
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell(columnName: 'id', value: e.id),
              DataGridCell(columnName: 'name', value: e.name),
              DataGridCell(
                  columnName: 'designation', value: e.designation),
              DataGridCell(columnName: 'salary', value: e.salary),
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>(
        (dataGridCell) {
          return Container(
            alignment: (dataGridCell.columnName == 'id' ||
                    dataGridCell.columnName == 'salary')
                ? Alignment.centerRight
                : Alignment.centerLeft,
            padding: const EdgeInsets.all(16.0),
            child: Text(dataGridCell.value.toString()),
          );
        },
      ).toList(),
    );
  }
}
