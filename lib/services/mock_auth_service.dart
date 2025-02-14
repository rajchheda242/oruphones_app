import 'package:shared_preferences/shared_preferences.dart';
import 'auth_service.dart';
import '../core/models/api_response.dart';
import 'package:stacked/stacked.dart';


class MockAuthService with ListenableServiceMixin {
  final _prefs = SharedPreferences.getInstance();
  bool _isLoggedIn = false;  // Default to false
  String? _phoneNumber;

  MockAuthService() {
    _initializeAuthState();
  }

  bool get isLoggedIn => _isLoggedIn;
  String? get phoneNumber => _phoneNumber;

  Future<void> _initializeAuthState() async {
    final prefs = await _prefs;
    _isLoggedIn = false;  // Always start as logged out
    _phoneNumber = null;  // Clear phone number
    await prefs.setBool('isLoggedIn', false);  // Ensure logged out in storage
    await prefs.remove('phoneNumber');  // Remove stored phone number
    notifyListeners();
  }

  Future<void> login(String phoneNumber) async {
    final prefs = await _prefs;
    _isLoggedIn = true;
    _phoneNumber = phoneNumber;
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('phoneNumber', phoneNumber);
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await _prefs;
    _isLoggedIn = false;
    _phoneNumber = null;
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('phoneNumber');
    notifyListeners();
  }

  Future<bool> verifyOtp(String otp) async {
    // Mock OTP verification
    await Future.delayed(const Duration(seconds: 1));
    return otp == '9999'; // For testing, accept only '9999' as valid OTP
  }

  @override
  Future<AuthResponse> checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 1));
    // Always return not authenticated
    return AuthResponse(
      isAuthenticated: false,
      user: User(name: '', joinDate: ''),
    );
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
    await Future.delayed(const Duration(seconds: 1));
    
    // Only authenticate if OTP is 9999
    final isValid = otp == 9999;
    return ApiResponse(
      success: true,
      data: AuthResponse(
        isAuthenticated: isValid,
        user: User(
          name: '',  // Always empty name
          joinDate: isValid ? DateTime.now().toString() : '',
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

  Future<void> updateAuthState(AuthResponse authResponse) async {
    _isLoggedIn = authResponse.isAuthenticated;
    notifyListeners();
  }

  // Implement other methods...
}
