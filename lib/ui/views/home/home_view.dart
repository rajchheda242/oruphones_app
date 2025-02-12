import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';
import 'widgets/home_menu_bar.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    final screenWidth = MediaQuery.of(context).size.width;
    final designWidth = 390.0;
    final scale = screenWidth / designWidth;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: screenWidth,
        margin: EdgeInsets.only(top: 47 * scale),
        child: Column(
          children: [
            const HomeMenuBar(),
            Expanded(
              child: SafeArea(
                top: false,
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
