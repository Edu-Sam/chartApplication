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
      Employee(10010, 'Grimes', 'Developer', 15000),
      Employee(10011, 'John', 'Manager', 30000),
      Employee(10012, 'Emily', 'Designer', 25000),
      Employee(10013, 'David', 'Architect', 35000),
      Employee(10014, 'Sarah', 'QA Engineer', 18000),
      Employee(10015, 'Anna', 'Data Analyst', 20000),
      Employee(10016, 'Robert', 'System Administrator', 22000),
      Employee(10017, 'Daniel', 'Network Engineer', 25000),
      Employee(10018, 'Jessica', 'UX Designer', 28000),
      Employee(10019, 'Thomas', 'Database Administrator', 27000),
      Employee(10020, 'Elizabeth', 'Technical Writer', 21000),
      // Batch 2
      Employee(10021, 'Oliver', 'Project Manager', 32000),
      Employee(10022, 'Sophia', 'Product Manager', 35000),
      Employee(10023, 'Ethan', 'Software Engineer', 26000),
      Employee(10024, 'Ava', 'Frontend Developer', 24000),
      Employee(10025, 'Mason', 'Backend Developer', 25000),
      Employee(10026, 'Isabella', 'Full Stack Developer', 28000),
      Employee(10027, 'Alexander', 'Mobile App Developer', 27000),
      Employee(10028, 'Mia', 'DevOps Engineer', 30000),
      Employee(10029, 'William', 'Cloud Architect', 35000),
      Employee(10030, 'Charlotte', 'Cybersecurity Analyst', 32000),
      Employee(10031, 'Henry', 'IT Consultant', 30000),
      Employee(10032, 'Amelia', 'Embedded Systems Engineer', 28000),
      Employee(10033, 'Liam', 'Machine Learning Engineer', 33000),
      Employee(10034, 'Ella', 'AI Specialist', 35000),
      Employee(10035, 'Benjamin', 'Blockchain Developer', 34000),
      Employee(10036, 'Avery', 'Quantum Computing Researcher', 40000),
      Employee(10037, 'Harper', 'Robotics Engineer', 38000),
      Employee(10038, 'Jameson', 'Bioinformatics Analyst', 37000),
      Employee(10039, 'Evelyn', 'Game Developer', 29000),
      Employee(10040, 'Jackson', 'UI/UX Designer', 27000),
      // Batch 3
      Employee(10041, 'Luna', 'Virtual Reality Developer', 32000),
      Employee(10042, 'Lucas', 'Augmented Reality Developer', 33000),
      Employee(10043, 'Lillian', 'Web Developer', 28000),
      Employee(10044, 'Grayson', 'Graphic Designer', 26000),
      Employee(10045, 'Amara', 'Digital Marketing Specialist', 29000),
      Employee(10046, 'Leo', 'Content Creator', 25000),
      Employee(10047, 'Zoe', 'Social Media Manager', 27000),
      Employee(10048, 'Logan', 'SEO Specialist', 26000),
      Employee(10049, 'Nova', 'Data Scientist', 35000),
      Employee(10050, 'Eli', 'Business Analyst', 30000),
      Employee(10051, 'Stella', 'Financial Analyst', 31000),
      Employee(10052, 'Carter', 'Investment Banker', 40000),
      Employee(10053, 'Aria', 'Actuary', 38000),
      Employee(10054, 'Finn', 'Economist', 37000),
      Employee(10055, 'Aurora', 'Quantitative Analyst', 36000),
      Employee(10056, 'Miles', 'Market Research Analyst', 29000),
      Employee(10057, 'Piper', 'Supply Chain Analyst', 28000),
      Employee(10058, 'Hudson', 'Operations Manager', 32000),
      Employee(10059, 'Willow', 'Logistics Coordinator', 27000),
      Employee(10060, 'Lincoln', 'Customer Success Manager', 30000),
      // Batch 4
      Employee(10061, 'Nova', 'Technical Support Specialist', 25000),
      Employee(10062, 'Declan', 'Customer Support Representative', 24000),
      Employee(10063, 'Adeline', 'Sales Executive', 28000),
      Employee(10064, 'Easton', 'Account Manager', 30000),
      Employee(10065, 'Elise', 'Business Development Manager', 31000),
      Employee(10066, 'Brooks', 'Account Executive', 29000),
      Employee(10067, 'Genevieve', 'Marketing Manager', 32000),
      Employee(10068, 'Knox', 'Brand Manager', 33000),
      Employee(10069, 'Gemma', 'Event Coordinator', 27000),
      Employee(10070, 'Kai', 'Project Coordinator', 26000),
      Employee(10071, 'Nora', 'HR Manager', 35000),
      Employee(10072, 'Rhett', 'Recruiter', 29000),
      Employee(10073, 'Riley', 'Training Specialist', 28000),
      Employee(10074, 'Sawyer', 'Corporate Trainer', 30000),
      Employee(10075, 'Seraphina', 'Executive Assistant', 31000),
      Employee(10076, 'Weston', 'Office Manager', 32000),
      Employee(10077, 'Violet', 'Administrative Assistant', 25000),
      Employee(10078, 'Felix', 'Legal Assistant', 26000),
      Employee(10079, 'Selena', 'Paralegal', 27000),
      Employee(10080, 'Xander', 'Law Clerk', 28000),
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
              DataGridCell(columnName: 'designation', value: e.designation),
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
