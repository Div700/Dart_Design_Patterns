import '../models/api_response.dart';

class ApiService {
  static int _callCount = 0;
  
  static Future<ApiResponse> makeApiCall(String request) async {
    _callCount++;
    await Future.delayed(Duration(milliseconds: 100));
    
    // First 2 succeed, next 3 fail, then succeed
    if (_callCount <= 2 || _callCount > 5) {
      return ApiResponse(isSuccess: true, data: 'Data for $request');
    } else {
      throw Exception('API failure');
    }
  }
  
  static void reset() => _callCount = 0;
}