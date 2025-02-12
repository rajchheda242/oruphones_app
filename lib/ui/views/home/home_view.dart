import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';
import 'widgets/home_menu_bar.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: 390,
        margin: const EdgeInsets.only(top: 47),
        child: Column(
          children: [
            const HomeMenuBar(),
            Expanded(
              child: SafeArea(
                top: false, // Since MenuBar is outside SafeArea
                child: Center(
                  child: Text('Home Content'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
