extension EnumToName on String{
  String enumToName() {
    final List<String> paths = split('.');
    return paths[1];
  }
}