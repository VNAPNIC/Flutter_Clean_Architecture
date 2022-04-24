part of style;

//Padding
double mPaddingLarge = 32;
double mPaddingNormal = 12;
double mPadding = 16;

double mMargin = 16.0;

// radius
double mRadiusSmall = 2;
double mRadiusNormal = 8;
double mRadiusLarge = 16;

// Font
double mH1 = 24;
double mH2 = 20;
double mH3 = 18;
double mH4 = 16;

double mFontSizePrimary = 16;
double mFontSizeSecondary = 14;
double mFontSizeSmall = 12;

// Border
roundedTextFieldBorder({Color? color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(mRadiusNormal),
    borderSide: BorderSide(color: color ?? mCInk300, width: 1),
  );
}

// CaptchaWidget
const paddingCaptcha = EdgeInsets.fromLTRB(16, 24, 16, 32);
final decorationCaptcha = BoxDecoration(
  color: mCInk200,
  borderRadius: BorderRadius.circular(mRadiusNormal),
  border: Border.all(color: mCInk300, width: 1),
);