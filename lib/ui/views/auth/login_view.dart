import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  final bool isBottomSheet;

  const LoginView({
    Key? key,
    this.isBottomSheet = false,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify OTP'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            SizedBox(height: 24.0),
            Text(
              'Verify Mobile No.',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Please enter the 4 digit verification code sent to your mobile number +91-7587329682 via SMS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 16.0),
            Text(
              "Didn't receive OTP?",
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
            SizedBox(height: 8.0),
            TextButton(
              onPressed: () {},
              child: Text(
                'Resend OTP in 0:23 Sec',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Verify OTP',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) =>
      LoginViewModel(isBottomSheet: isBottomSheet);
}
