// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/foundation.dart' as _i10;
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:oruphones_app/ui/views/auth/confirm_name_view.dart' as _i7;
import 'package:oruphones_app/ui/views/auth/login_view.dart' as _i5;
import 'package:oruphones_app/ui/views/auth/phone_input_view.dart' as _i4;
import 'package:oruphones_app/ui/views/auth/verify_otp_view.dart' as _i6;
import 'package:oruphones_app/ui/views/home/home_view.dart' as _i8;
import 'package:oruphones_app/ui/views/landing/landing_view.dart' as _i3;
import 'package:oruphones_app/ui/views/splash/splash_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;

class Routes {
  static const splashView = '/splash-view';

  static const landingView = '/landing-view';

  static const phoneInputView = '/phone-input-view';

  static const loginView = '/login-view';

  static const verifyOtpView = '/verify-otp-view';

  static const confirmNameView = '/confirm-name-view';

  static const homeView = '/home-view';

  static const all = <String>{
    splashView,
    landingView,
    phoneInputView,
    loginView,
    verifyOtpView,
    confirmNameView,
    homeView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.landingView,
      page: _i3.LandingView,
    ),
    _i1.RouteDef(
      Routes.phoneInputView,
      page: _i4.PhoneInputView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.verifyOtpView,
      page: _i6.VerifyOtpView,
    ),
    _i1.RouteDef(
      Routes.confirmNameView,
      page: _i7.ConfirmNameView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i8.HomeView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
      );
    },
    _i3.LandingView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LandingView(),
        settings: data,
      );
    },
    _i4.PhoneInputView: (data) {
      final args = data.getArgs<PhoneInputViewArguments>(
        orElse: () => const PhoneInputViewArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.PhoneInputView(
            key: args.key, isBottomSheet: args.isBottomSheet),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.LoginView(
            key: args.key,
            isBottomSheet: args.isBottomSheet,
            phoneNumber: args.phoneNumber),
        settings: data,
      );
    },
    _i6.VerifyOtpView: (data) {
      final args = data.getArgs<VerifyOtpViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.VerifyOtpView(
            key: args.key,
            isBottomSheet: args.isBottomSheet,
            phoneNumber: args.phoneNumber),
        settings: data,
      );
    },
    _i7.ConfirmNameView: (data) {
      final args = data.getArgs<ConfirmNameViewArguments>(
        orElse: () => const ConfirmNameViewArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.ConfirmNameView(
            key: args.key, isBottomSheet: args.isBottomSheet),
        settings: data,
      );
    },
    _i8.HomeView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.HomeView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class PhoneInputViewArguments {
  const PhoneInputViewArguments({
    this.key,
    this.isBottomSheet = false,
  });

  final _i10.Key? key;

  final bool isBottomSheet;

  @override
  String toString() {
    return '{"key": "$key", "isBottomSheet": "$isBottomSheet"}';
  }

  @override
  bool operator ==(covariant PhoneInputViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.isBottomSheet == isBottomSheet;
  }

  @override
  int get hashCode {
    return key.hashCode ^ isBottomSheet.hashCode;
  }
}

class LoginViewArguments {
  const LoginViewArguments({
    this.key,
    this.isBottomSheet = false,
    required this.phoneNumber,
  });

  final _i10.Key? key;

  final bool isBottomSheet;

  final String phoneNumber;

  @override
  String toString() {
    return '{"key": "$key", "isBottomSheet": "$isBottomSheet", "phoneNumber": "$phoneNumber"}';
  }

  @override
  bool operator ==(covariant LoginViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.isBottomSheet == isBottomSheet &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return key.hashCode ^ isBottomSheet.hashCode ^ phoneNumber.hashCode;
  }
}

class VerifyOtpViewArguments {
  const VerifyOtpViewArguments({
    this.key,
    this.isBottomSheet = false,
    required this.phoneNumber,
  });

  final _i10.Key? key;

  final bool isBottomSheet;

  final String phoneNumber;

  @override
  String toString() {
    return '{"key": "$key", "isBottomSheet": "$isBottomSheet", "phoneNumber": "$phoneNumber"}';
  }

  @override
  bool operator ==(covariant VerifyOtpViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.isBottomSheet == isBottomSheet &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return key.hashCode ^ isBottomSheet.hashCode ^ phoneNumber.hashCode;
  }
}

class ConfirmNameViewArguments {
  const ConfirmNameViewArguments({
    this.key,
    this.isBottomSheet = false,
  });

  final _i10.Key? key;

  final bool isBottomSheet;

  @override
  String toString() {
    return '{"key": "$key", "isBottomSheet": "$isBottomSheet"}';
  }

  @override
  bool operator ==(covariant ConfirmNameViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.isBottomSheet == isBottomSheet;
  }

  @override
  int get hashCode {
    return key.hashCode ^ isBottomSheet.hashCode;
  }
}

extension NavigatorStateExtension on _i11.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLandingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.landingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPhoneInputView({
    _i10.Key? key,
    bool isBottomSheet = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.phoneInputView,
        arguments:
            PhoneInputViewArguments(key: key, isBottomSheet: isBottomSheet),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView({
    _i10.Key? key,
    bool isBottomSheet = false,
    required String phoneNumber,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(
            key: key, isBottomSheet: isBottomSheet, phoneNumber: phoneNumber),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyOtpView({
    _i10.Key? key,
    bool isBottomSheet = false,
    required String phoneNumber,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.verifyOtpView,
        arguments: VerifyOtpViewArguments(
            key: key, isBottomSheet: isBottomSheet, phoneNumber: phoneNumber),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConfirmNameView({
    _i10.Key? key,
    bool isBottomSheet = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.confirmNameView,
        arguments:
            ConfirmNameViewArguments(key: key, isBottomSheet: isBottomSheet),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLandingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.landingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPhoneInputView({
    _i10.Key? key,
    bool isBottomSheet = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.phoneInputView,
        arguments:
            PhoneInputViewArguments(key: key, isBottomSheet: isBottomSheet),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView({
    _i10.Key? key,
    bool isBottomSheet = false,
    required String phoneNumber,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(
            key: key, isBottomSheet: isBottomSheet, phoneNumber: phoneNumber),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyOtpView({
    _i10.Key? key,
    bool isBottomSheet = false,
    required String phoneNumber,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.verifyOtpView,
        arguments: VerifyOtpViewArguments(
            key: key, isBottomSheet: isBottomSheet, phoneNumber: phoneNumber),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConfirmNameView({
    _i10.Key? key,
    bool isBottomSheet = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.confirmNameView,
        arguments:
            ConfirmNameViewArguments(key: key, isBottomSheet: isBottomSheet),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
