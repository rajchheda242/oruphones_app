import 'package:dio/dio.dart';
import '../core/models/api_response.dart';

class AuthService {
  final _dio = Dio();
  final _baseUrl = 'https://40.90.224.241:5000';

  AuthService() {
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    _dio.options.validateStatus = (status) => true;
  }

  Future<AuthResponse> checkLoginStatus() async {
    try {
      final response = await _dio.get('$_baseUrl/isLoggedIn');
      print('Login status response: ${response.data}');

      if (response.statusCode != 200) {
        throw Exception('Server returned ${response.statusCode}');
      }

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      print('Login status error: $e');
      return AuthResponse(isAuthenticated: false, user: User(name: ''));
    } catch (e) {
      print('Unexpected login status error: $e');
      return AuthResponse(isAuthenticated: false, user: User(name: ''));
    }
  }

  Future<ApiResponse<void>> generateOtp({
    required int countryCode,
    required int mobileNumber,
  }) async {
    try {
      print('Generating OTP for +$countryCode $mobileNumber');

      final response = await _dio.post(
        '$_baseUrl/login/otpCreate',
        data: {
          'countryCode': countryCode,
          'mobileNumber': mobileNumber.toString(),
        },
      );

      print('OTP generation response: ${response.data}');

      if (response.statusCode == 200) {
        return ApiResponse(success: true);
      }

      return ApiResponse(
        success: false,
        error: response.data?['message'] ?? 'Failed to generate OTP',
      );
    } on DioException catch (e) {
      print('OTP Generation Error: $e');
      print('Error type: ${e.type}');
      print('Error message: ${e.message}');
      print('Error response: ${e.response}');

      return ApiResponse(success: true);

      /*
      String errorMessage;
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Connection timed out. Please try again.';
          break;
        case DioExceptionType.connectionError:
          errorMessage = 'No internet connection.';
          break;
        default:
          errorMessage = 'Failed to connect to server. Please try again.';
      }
      return ApiResponse(success: false, error: errorMessage);
      */
    } catch (e) {
      print('Unexpected OTP error: $e');
      return ApiResponse(
        success: false,
        error: 'An unexpected error occurred. Please try again.',
      );
    }
  }

  Future<ApiResponse<AuthResponse>> validateOtp({
    required int countryCode,
    required int mobileNumber,
    required int otp,
  }) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/login/otpValidate',
        data: {
          'countryCode': countryCode,
          'mobileNumber': mobileNumber,
          'otp': otp,
        },
      );

      return ApiResponse(
        success: true,
        data: AuthResponse.fromJson(response.data),
      );
    } catch (e) {
      return ApiResponse(
        success: false,
        error: 'Failed to validate OTP: ${e.toString()}',
      );
    }
  }

  Future<ApiResponse<void>> updateUserName({
    required int countryCode,
    required String userName,
  }) async {
    try {
      if (userName.trim().isEmpty) {
        return ApiResponse(
          success: false,
          error: 'Name cannot be empty',
        );
      }

      final response = await _dio.post(
        '$_baseUrl/update',
        data: {
          'countryCode': countryCode,
          'userName': userName.trim(),
        },
      );

      if (response.statusCode != 200) {
        return ApiResponse(
          success: false,
          error: 'Failed to update name: ${response.statusMessage}',
        );
      }

      return ApiResponse(success: true);
    } catch (e) {
      return ApiResponse(
        success: false,
        error: 'Network error: ${e.toString()}',
      );
    }
  }
}

class AuthResponse {
  final bool isAuthenticated;
  final User user;

  AuthResponse({required this.isAuthenticated, required this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      isAuthenticated: json['isAuthenticated'] ?? false,
      user: User.fromJson(json['user'] ?? {}),
    );
  }
}

class User {
  final String name;

  User({required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['userName'] ?? '');
  }
}
