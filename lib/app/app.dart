import 'package:oruphones_app/services/auth_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../ui/views/auth/login_view.dart';
import '../ui/views/auth/verify_otp_view.dart';
import '../ui/views/auth/confirm_name_view.dart';
import '../ui/views/splash/splash_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/auth/phone_input_view.dart';
import '../ui/views/landing/landing_view.dart';
import '../ui/views/sample/sample_view.dart';

@StackedApp(
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
  ],
  routes: [
    MaterialRoute(page: SampleView),
    MaterialRoute(page: SplashView),
    MaterialRoute(page: LandingView),
    MaterialRoute(page: PhoneInputView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: VerifyOtpView),
    MaterialRoute(page: ConfirmNameView),
    MaterialRoute(page: HomeView),
  ],
)
class App {}
