import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({
    super.key,
    this.tableSelectionMode,
    this.editTable,
    this.sortTable,
    this.sortTableColumns,
    this.resetSortTable,
    this.doubleTapSort,
    this.sortIconColor,
    this.tableData,
    this.tableHeaders,
  });
  final List? tableData;
  final List? tableHeaders;
  final SelectionMode? tableSelectionMode;
  final bool? editTable;
  final bool? sortTable;
  final bool? sortTableColumns;
  final bool? resetSortTable;
  final bool? doubleTapSort;
  final Color? sortIconColor;

  @override
  Widget build(BuildContext context) {
    Widget output = const SizedBox();
    if (tableHeaders != null && tableData != null) {
      DataSource dataTableSource = DataSource(
        columnHeaders: tableHeaders!,
        dataSource: tableData!,
        isEditable: editTable ?? false,
      );
      output = SfDataGridTheme(
        data: SfDataGridThemeData(sortIconColor: sortIconColor ?? Colors.black),
        child: SfDataGrid(
          source: dataTableSource,
          allowEditing: editTable ?? false,
          selectionMode: tableSelectionMode ?? SelectionMode.none,
          navigationMode: GridNavigationMode.cell,
          allowSorting: sortTable ?? false,
          allowMultiColumnSorting: sortTableColumns ?? false,
          allowTriStateSorting: resetSortTable ?? false,
          sortingGestureType: doubleTapSort != null && doubleTapSort == true
              ? SortingGestureType.doubleTap
              : SortingGestureType.tap,
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both,
          editingGestureType: EditingGestureType.tap,
          columnWidthMode: ColumnWidthMode.auto,
          columns: List.generate(
            tableHeaders!.length,
            (index) => GridColumn(
              columnName: tableHeaders![index],
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Text(tableHeaders![index]),
              ),
            ),
          ),
        ),
      );
    }
    return output;
  }
}

class DataSource extends DataGridSource {
  DataSource({
    required List dataSource,
    required List columnHeaders,
    required bool isEditable,
  }) {
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
    _isEditable = isEditable;
  }

  late List<DataGridRow> _dataSource;
  late bool _isEditable;

  @override
  List<DataGridRow> get rows => _dataSource;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>(
        (dataGridCell) {
          TextEditingController controller =
              TextEditingController(text: '${dataGridCell.value ?? "n/a"}');
          return Container(
            alignment: Alignment.center,
            child: Center(
              child: TextFormField(
                readOnly: _isEditable,
                controller: controller,
                onChanged: (value) {
                  print(value);
                },
                onTap: !_isEditable ? null : () {},
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}

class EditableDataSource extends DataGridSource {
  final List _dataSource;
  final List _columnHeaders;

  EditableDataSource({required List dataSource, required List columnHeaders})
      : _dataSource = dataSource,
        _columnHeaders = columnHeaders {
    _dataGridRows = _dataSource.map<DataGridRow>(
      (e) {
        return DataGridRow(
          cells: _columnHeaders.map<DataGridCell>(
            (header) {
              return DataGridCell(columnName: header, value: e[header]);
            },
          ).toList(),
        );
      },
    ).toList();
  }

  late List<DataGridRow> _dataGridRows;

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>(
        (dataGridCell) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Text('${dataGridCell.value ?? "N/A"}'),
          );
        },
      ).toList(),
    );
  }

  @override
  Widget? buildEditWidget(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
    TextEditingController editingController = TextEditingController();
    editingController.text =
        dataGridRow.getCells()[rowColumnIndex.columnIndex].value.toString();

    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: TextField(
        controller: editingController,
        textAlign: TextAlign.center,
        onChanged: (String value) {
          // Update the value in the data source immediately
          _dataSource[rowColumnIndex.rowIndex][column.columnName] = value;
        },
        onSubmitted: (String value) {
          // Call the submitCell callback to save the changes
          submitCell();
        },
      ),
    );
  }

  @override
  Future<void> onCellSubmit(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column) async {
    // Since we've already updated the value in the data source in buildEditWidget,
    // there's nothing specific we need to do here.
    return Future.value();
  }
}
