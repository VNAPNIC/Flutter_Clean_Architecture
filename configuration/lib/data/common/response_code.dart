class ResponseCode {
  // Error
  static const int SERVER_SUCCESSFULLY = 0;
  static const int SERVER_UNKNOWN_ERROR = 1;


  static const int CLIENT_UNKNOWN_ERROR = 9000;
  static const int NOT_CONNECTION_INTERNET = 9001;
  static const int SERVER_MAINTAIN = 9002;
}

extension messageResponse on int {
  String? get message => messages[this];

  static final messages = <int, String>{
    // ResponseCode.SERVER_SUCCESS: S.current.,
    // ResponseCode.SERVER_UNKNOWN_ERROR: S.current.,
  };
}
