// Class name => MyApp
// screen name => home_page
// method name => getData()
class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  @override
  String toString() {
    // TODO: implement toString
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error while communicating");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid request");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, "Unauthorized access");
}
