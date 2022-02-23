part of style;

//Padding
double mPaddingLarge = 32.w;
double mPaddingNormal = 12.w;
double mPadding = 16.w;

double mMargin = 16.0.h;

// radius
double mRadiusSmall = 2.r;
double mRadiusNormal = 8.r;
double mRadiusLarge = 16.r;

// Font
double mH1 = 24.sp;
double mH2 = 20.sp;
double mH3 = 18.sp;
double mH4 = 16.sp;

double mFontSizePrimary = 16.sp;
double mFontSizeSecondary = 14.sp;
double mFontSizeSmall = 12.sp;

// Border
roundedTextFieldBorder({Color? color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(mRadiusNormal),
    borderSide: BorderSide(color: color ?? mCInk300, width: 1),
  );
}

// CaptchaWidget
final paddingCaptcha = EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 32.h);
final decorationCaptcha = BoxDecoration(
  color: mCInk200,
  borderRadius: BorderRadius.circular(mRadiusNormal),
  border: Border.all(color: mCInk300, width: 1),
);