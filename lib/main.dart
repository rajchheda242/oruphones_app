import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.router.dart';
import 'app/app.locator.dart';
import 'services/auth_service.dart';
import 'services/mock_auth_service.dart';
import 'ui/views/auth/phone_input_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  // Register mock service before running the app
  locator.unregister<AuthService>(); // Remove any existing registration
  locator.registerLazySingleton<AuthService>(() => MockAuthService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OruPhones',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
