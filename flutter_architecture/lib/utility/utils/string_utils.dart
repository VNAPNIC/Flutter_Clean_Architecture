class StringUtils{
  static String enumToName(String enumToString){
    final List<String> paths = enumToString.split(',');
    return paths[paths.length - 1];
  }
}