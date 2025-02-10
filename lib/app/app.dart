import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../ui/views/auth/login_view.dart';
import '../ui/views/auth/verify_otp_view.dart';
import '../ui/views/auth/confirm_name_view.dart';
import '../ui/views/splash/splash_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/auth/phone_input_view.dart';

@StackedApp(
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
  routes: [
    MaterialRoute(page: PhoneInputView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: VerifyOtpView),
    MaterialRoute(page: ConfirmNameView),
    MaterialRoute(page: HomeView),
    // TODO: Add HomeView route
  ],
)
class App {}
