import 'package:configuration/utility/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

enum EnumTest { enumValue }
void main() {
  test('enum to name', () {
    expect(
        EnumTest.enumValue.toString().enumToName(), 'enumValue');
  });
}
