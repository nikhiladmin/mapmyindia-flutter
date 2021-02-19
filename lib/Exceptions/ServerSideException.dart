class ServerSideException implements Exception {
  final String message;
  ServerSideException(this.message);

  @override
  String toString() {
    return message;
  }
}
