import 'package:dio/dio.dart';
import '../core/models/api_response.dart';

class AuthService {
  final _dio = Dio();
  final _baseUrl = 'http://40.90.224.241:5000';

  Future<AuthResponse> checkLoginStatus() async {
    try {
      final response = await _dio.get('$_baseUrl/isLoggedIn');
      return AuthResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to check auth status');
    }
  }

  Future<ApiResponse<void>> generateOtp({
    required int countryCode,
    required int mobileNumber,
  }) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/login/otpCreate',
        data: {
          'countryCode': countryCode,
          'mobileNumber': mobileNumber,
        },
      );

      return ApiResponse(success: true);
    } catch (e) {
      return ApiResponse(
        success: false,
        error: 'Failed to generate OTP: ${e.toString()}',
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
