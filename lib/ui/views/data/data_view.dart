import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'data_viewmodel.dart';

class DataView extends StackedView<DataViewModel> {
  const DataView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DataViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 300,
              width: 600,
              color: Colors.purple,
            ),
            ElevatedButton(
              onPressed: () {
                print(viewModel.apiData);
              },
              child: Text('Get Data from random url'),
            )
          ],
        ),
      ),
    );
  }

  @override
  DataViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DataViewModel();

  @override
  void onViewModelReady(DataViewModel viewModel) {
    viewModel.getData();
    super.onViewModelReady(viewModel);
  }

  @override
  bool get disposeViewModel => false;
}
