import 'auth_service.dart';
import '../core/models/api_response.dart';

class MockAuthService extends AuthService {
  @override
  Future<AuthResponse> checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 1));
    return AuthResponse(isAuthenticated: false, user: User(name: '', joinDate: ''));
  }

  @override
  Future<ApiResponse<void>> generateOtp({
    required int countryCode,
    required int mobileNumber,
  }) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse(success: true);
  }

  @override
  Future<ApiResponse<AuthResponse>> validateOtp({
    required int countryCode,
    required int mobileNumber,
    required int otp,
  }) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock successful login
    return ApiResponse(
      success: true,
      data: AuthResponse(
        isAuthenticated: true,
        user: User(
          name: '',  // Empty name for new user
          joinDate: DateTime.now().toString(),
        ),
      ),
    );
  }

  @override
  Future<ApiResponse<void>> updateUserName({
    required int countryCode,
    required String userName,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    print('Mock update username: $userName');
    return ApiResponse(success: true);
  }

  // Implement other methods...
}
