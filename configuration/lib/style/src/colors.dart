part of style;

Color mBarrierDialogColor = Colors.grey.withOpacity(0.4);

/// Brand
// Primary color: The predominant color in UI and is normally connected with the main color of the brand.
// Secondary color: Complement the primary color.
final Color mCPrimary = HexColor.fromHex('#1971FF');
final Color mCSecondary = HexColor.fromHex('#3B0696');
final Color mCSmartOne = HexColor.fromHex('#922028');

/// Neutral
// Normally used for backgrounds, borders, texts and tertiary buttons and actions.
final Color mCInk500 = HexColor.fromHex('#0F1A2A');
final Color mCInk400 = HexColor.fromHex('#64748B');
final Color mCInk300 = HexColor.fromHex('#CBD4E1');
final Color mCInk200 = HexColor.fromHex('#F1F4F9');
final Color mCInk100 = HexColor.fromHex('#F6F8FC');
final Color mCWhite = HexColor.fromHex('#FFFFFF');

/// Semantic
// Green: For success or confirmation messages and actions.
// Blue: To draw users attention for system messages and status with an informative intention.
// Orange: For critical information or warning messages.
// Red: For negative or destructive messages and actions.

// green
final Color mCGreen500 = HexColor.fromHex('#009D24');
final Color mCGreen400 = HexColor.fromHex('#2EB246');
final Color mCGreen300 = HexColor.fromHex('#87DC8F');
final Color mCGreen200 = HexColor.fromHex('#C1F1C3');
final Color mCGreen100 = HexColor.fromHex('#E0F9E0');

// blue
final Color mCBlue500 = HexColor.fromHex('#1971FF');
final Color mCBlue400 = HexColor.fromHex('#74B1FF');
final Color mCBlue300 = HexColor.fromHex('#A2CFFF');
final Color mCBlue200 = HexColor.fromHex('#D1ECFF');
final Color mCBlue100 = HexColor.fromHex('#EAF0FF');

// orange
final Color mCOrange500 = HexColor.fromHex('#FB6008');
final Color mCOrange400 = HexColor.fromHex('#FFA567');
final Color mCOrange300 = HexColor.fromHex('#FFC598');
final Color mCOrange200 = HexColor.fromHex('#FFE5CA');
final Color mCOrange100 = HexColor.fromHex('#FFF2E5');

// red
final Color mCRed500 = HexColor.fromHex('#DF1A11');
final Color mCRed400 = HexColor.fromHex('#FB5049');
final Color mCRed300 = HexColor.fromHex('#FEB4B4');
final Color mCRed200 = HexColor.fromHex('#FFDCDC');
final Color mCRed100 = HexColor.fromHex('#FFEFEF');

// shadow
final Color mCShadow = HexColor.fromHex('#011222');

// background blur
final Color mCBgBlur = HexColor.fromHex('#000000');
// Misc
final Gradient mCGradientBrand = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [mCPrimary, mCSecondary],
);

final Gradient mCSkeleton = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [mCInk100, mCInk300],
);

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
