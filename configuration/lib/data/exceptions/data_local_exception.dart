import 'package:configuration/generated/l10n.dart';

class DataLocalException {
  late String errorMessage;

  DataLocalException.sqlite() : errorMessage = S.current.database_exception;
}
