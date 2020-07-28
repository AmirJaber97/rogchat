class Failure {
  final int code;
  final String message;

  Failure(this.message, {this.code});

  @override
  String toString() {
    if (code == null) {
      return message;
    }
    switch (code) {
      case 0:
        return 'Could not connect to the internet';
      case 400:
        return 'Sorry, we could not find that 😱';
      case 401:
      case 403:
        return 'Not authorized 😱';
      case 500:
      default:
        return 'Something wrong happened.. 😱';
    }
  }
}
