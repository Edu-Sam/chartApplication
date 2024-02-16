import 'package:flutter/material.dart';
import 'package:my_chart_app/ui/common/ui_helpers.dart';
import 'package:my_chart_app/ui/widgetss/table_widget.dart';
import 'package:stacked/stacked.dart';

import 'data_table_viewmodel.dart';

class DataTableView extends StatelessWidget {
  const DataTableView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => DataTableViewModel(),
        onViewModelReady: (viewModel) {
          viewModel.getData();
        },
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Data Table Example',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  verticalSpaceSmall,
                  ElevatedButton(
                    onPressed: () {
                      viewModel.getDataFronUrl('');
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    child: const Text('Get Data from random url'),
                  ),
                  verticalSpaceSmall,
                  viewModel.isFetching
                      ? const Center(child: CircularProgressIndicator())
                      : Expanded(
                          child: ListView(
                            // shrinkWrap: true,
                            children: [
                              if (viewModel.tableData != {} ||
                                  viewModel.tableData.isNotEmpty)
                                // ---------  DataTable Widget ------------------ //
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: DataTableWidget(
                                    tableData: viewModel.tableData['data'],
                                    tableHeaders: viewModel.tableHeaders,
                                    editTable: viewModel.tableData['can_edit'],
                                    sortTable: viewModel.tableData['sorting'],
                                    sortTableColumns:
                                        viewModel.tableData['sort_multiple'],
                                  ),
                                ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          );
        });
  }
}
