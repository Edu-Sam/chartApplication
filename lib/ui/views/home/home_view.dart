import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:my_chart_app/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              children: [
                verticalSpaceMedium,
                const Text(
                  "Widgets",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                verticalSpaceMedium,
                Expanded(
                  child: GridView.builder(
                    itemCount: viewModel.widgetTitle.length,
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => viewModel
                          .navigateToWidget(viewModel.widgetTitle[index]),
                      child: Container(
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            viewModel.widgetTitle[index],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 15,
                      childAspectRatio: 2,
                    ),
                  ),
                ),
                verticalSpaceMedium,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
