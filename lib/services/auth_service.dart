import 'package:dio/dio.dart';
import '../core/models/api_response.dart';
import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  final _dio = Dio();
  final _baseUrl = 'http://40.90.224.241:5000';
  bool _isLoggedIn = false;
  User? _currentUser;
  bool _isAuthenticated = false;

  bool get isLoggedIn => _isLoggedIn;
  User? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;

  AuthService() {
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    _dio.options.validateStatus = (status) => true;
    
    initialize();
  }

  Future<AuthResponse> checkLoginStatus() async {
    return AuthResponse(
      isAuthenticated: _isAuthenticated,
      user: _currentUser ?? User(name: '', joinDate: ''),
    );
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
          'mobileNumber': mobileNumber,
        },
      );

      print('OTP generation response: ${response.data}');

      // For development, return success even if API fails
      return ApiResponse(success: true);
    } catch (e) {
      print('OTP Generation Error: $e');
      // For development, return success even if there's an error
      return ApiResponse(success: true);
    }
  }

  Future<ApiResponse<AuthResponse>> validateOtp({
    required int countryCode,
    required int mobileNumber,
    required int otp,
  }) async {
    // Real OTP validation logic here
    final isValid = otp == 9999; // For testing, can be replaced with real validation
    
    if (isValid) {
      _isAuthenticated = true;
      _currentUser = User(
        name: '',
        joinDate: DateTime.now().toString(),
      );
    }

    return ApiResponse(
      success: true,
      data: AuthResponse(
        isAuthenticated: _isAuthenticated,
        user: _currentUser ?? User(name: '', joinDate: ''),
      ),
    );
  }

  Future<ApiResponse<void>> updateUserName({
    required int countryCode,
    required String userName,
  }) async {
    // Temporarily mock successful response
    return ApiResponse(success: true);
    
    /* Comment out actual API call for now
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
    */
  }

  Future<void> initialize() async {
    try {
      final response = await checkLoginStatus();
      updateAuthState(response);  // Use updateAuthState to ensure consistency
    } catch (e) {
      logout();  // Use logout to ensure consistency
    }
  }

  void updateAuthState(AuthResponse response) {
    _isLoggedIn = response.isAuthenticated;
    _isAuthenticated = response.isAuthenticated;
    _currentUser = response.user;
    notifyListeners();
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _currentUser = null;
    notifyListeners();
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
  final String joinDate;
  final String? profileImage;

  User({
    required this.name,
    required String joinDate,
    this.profileImage,
  }) : joinDate = _formatDate(joinDate);

  static String _formatDate(String date) {
    try {
      final DateTime dateTime = DateTime.parse(date);
      return 'Joined: ${_getMonth(dateTime.month)} ${dateTime.day} ${dateTime.year}';
    } catch (e) {
      return 'Joined: Unknown';
    }
  }

  static String _getMonth(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['userName'] ?? '',
      joinDate: json['joinDate'] ?? DateTime.now().toIso8601String(),
      profileImage: json['profileImage'],
    );
  }
}
