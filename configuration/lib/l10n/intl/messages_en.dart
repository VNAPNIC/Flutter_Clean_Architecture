// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "cancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
        "connectTimeout":
            MessageLookupByLibrary.simpleMessage("Connect timeout"),
        "connectionProblem":
            MessageLookupByLibrary.simpleMessage("Không có kết nối mạng"),
        "connectionProblemDesc": MessageLookupByLibrary.simpleMessage(
            "Vui lòng kiểm tra lại tín hiệu Wifi hoặc 3G/4G của bạn."),
        "databaseException":
            MessageLookupByLibrary.simpleMessage("Database exception"),
        "getSetting": MessageLookupByLibrary.simpleMessage("Get setting"),
        "receiveTimeout":
            MessageLookupByLibrary.simpleMessage("Receive timeout"),
        "sendTimeout": MessageLookupByLibrary.simpleMessage("Send timeout"),
        "serverNotFound":
            MessageLookupByLibrary.simpleMessage("Server not found"),
        "serverUnknownError":
            MessageLookupByLibrary.simpleMessage("Hệ thống có chút vấn đề")
      };
}
