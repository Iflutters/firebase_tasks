class Failure implements Exception {
  String message;
  String? stackTrace;
  
  Failure(this.message);
}