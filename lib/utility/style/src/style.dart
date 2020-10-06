part of style;

class Style{
 static void styleDefault() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: mColorNavigationBar,
        systemNavigationBarIconBrightness: Brightness.light));
  }
}
