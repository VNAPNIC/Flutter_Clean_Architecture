import 'package:flutter_architecture/utility/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

enum EnumTest{
  ENUM_VALUE
}
void main(){
  test('enum to name', (){
    expect(StringUtils.enumToName(EnumTest.ENUM_VALUE.toString()), 'ENUM_VALUE');
  });
}