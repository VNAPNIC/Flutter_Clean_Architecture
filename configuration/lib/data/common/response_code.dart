import 'package:configuration/generated/l10n.dart';

class ResponseCode {
  static const SUCCESS = 200;
  static const FAILED = 500;
  static const NOT_FOUND = 404;
  static const UNAUTHORIZED = 401;
  static const FORBIDDEN = 403;
  static const EXPECTATION_FAILED = 417;

  // Error
  static const SERVER_UNKNOWN_ERROR = 1000;

  static const EMAIL_PASSWORD_INCORRECT = 1001;
  static const SOCIAL_PASSWORD_INCORRECT = 1002;

  static const PHONE_NUMBER_NOT_EXISTS = 1003;

  static const PASSWORD_IS_NULL_BLANK = 1004;
  static const EMAIL_IS_NULL_BLANK = 1005;

  static const EMAIL_IS_EXISTS = 1006;
  static const SOCIAL_IS_EXISTS = 1007;

  static const PHONE_NUMBER_IS_NULL_BLANK = 1008;
  static const PHONE_NUMBER_IS_EXISTS = 1009;

  static const STAFF_CODE_IS_NULL_BLANK = 1010;

  static const FILE_TOO_LARGE = 1011;

  static const FILE_UPLOAD_FAIL = 1012;

  static const UNSUPPORTED_MEDIA_TYPE = 1013;

  static const UNSUPPORTED_DEVICE = 1014;

  static const PHONE_NUMBER_WRONG_FORMAT = 1015;

  static const EMAIL_WRONG_FORMAT = 1016;

  static const USER_NOT_FOUND = 1017;

  static const WARNING_DATA_FORMAT = 1018;

  static const VERIFY_CODE_EXPIRE = 1019;

  static const VERIFY_CODE_INCORRECT = 1020;

  static const WRONG_TOO_MANY_TIME = 1021;
}

extension messageResponse on int {
  String? get message => messages[this];

  static final messages = <int, String>{
    // ResponseCode.SUCCESS: S.current.code_200,
    // ResponseCode.FAILED: S.current.code_500,
    // ResponseCode.NOT_FOUND: S.current.code_404,
    // ResponseCode.UNAUTHORIZED: S.current.code_403,
    // ResponseCode.FORBIDDEN: S.current.code_401,
    // ResponseCode.EXPECTATION_FAILED: S.current.code_417,
    //
    // // Error
    // ResponseCode.SERVER_UNKNOWN_ERROR: S.current.code_1000,
    //
    // ResponseCode.EMAIL_PASSWORD_INCORRECT: S.current.code_1001,
    // ResponseCode.SOCIAL_PASSWORD_INCORRECT: S.current.code_1002,
    //
    // ResponseCode.PHONE_NUMBER_NOT_EXISTS: S.current.code_1003,
    //
    // ResponseCode.PASSWORD_IS_NULL_BLANK: S.current.code_1004,
    // ResponseCode.EMAIL_IS_NULL_BLANK: S.current.code_1005,
    //
    // ResponseCode.EMAIL_IS_EXISTS: S.current.code_1006,
    // ResponseCode.SOCIAL_IS_EXISTS: S.current.code_1007,
    //
    // ResponseCode.PHONE_NUMBER_IS_NULL_BLANK: S.current.code_1008,
    // ResponseCode.PHONE_NUMBER_IS_EXISTS: S.current.code_1009,
    //
    // ResponseCode.STAFF_CODE_IS_NULL_BLANK: S.current.code_1010,
    //
    // ResponseCode.FILE_TOO_LARGE: S.current.code_1011,
    //
    // ResponseCode.FILE_UPLOAD_FAIL: S.current.code_1012,
    //
    // ResponseCode.UNSUPPORTED_MEDIA_TYPE: S.current.code_1013,
    //
    // ResponseCode.UNSUPPORTED_DEVICE: S.current.code_1014,
    //
    // ResponseCode.PHONE_NUMBER_WRONG_FORMAT: S.current.code_1015,
    //
    // ResponseCode.EMAIL_WRONG_FORMAT: S.current.code_1016,
    //
    // ResponseCode.USER_NOT_FOUND: S.current.code_1017,
    //
    // ResponseCode.WARNING_DATA_FORMAT: S.current.code_1018,
    //
    // ResponseCode.VERIFY_CODE_EXPIRE: S.current.code_1019,
    //
    // ResponseCode.VERIFY_CODE_INCORRECT: S.current.code_1020,
    //
    // ResponseCode.WRONG_TOO_MANY_TIME: S.current.code_1021,
  };
}
