import 'auth_service.dart';
import '../core/models/api_response.dart';

class MockAuthService extends AuthService {
  @override
  Future<AuthResponse> checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 1));
    return AuthResponse(isAuthenticated: false, user: User(name: ''));
  }

  @override
  Future<ApiResponse<void>> generateOtp({
    required int countryCode,
    required int mobileNumber,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    print('Mock OTP generated for +$countryCode $mobileNumber');
    return ApiResponse(success: true);
  }

  @override
  Future<ApiResponse<AuthResponse>> validateOtp({
    required int countryCode,
    required int mobileNumber,
    required int otp,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    print('Mock OTP validated: $otp');
    return ApiResponse(
      success: true,
      data: AuthResponse(
        isAuthenticated: true,
        user: User(name: ''),
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
