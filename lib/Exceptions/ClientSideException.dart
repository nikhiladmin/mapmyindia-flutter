class ClientSideException implements Exception {
  final String message;
  ClientSideException(this.message);

  @override
  String toString() {
    return message;
  }
}
