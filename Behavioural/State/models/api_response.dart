class ApiResponse {
  final bool isSuccess;
  final String data;

  ApiResponse({required this.isSuccess, required this.data});

  @override
  String toString() => isSuccess ? 'SUCCESS: $data' : 'FAILED: $data';
}
