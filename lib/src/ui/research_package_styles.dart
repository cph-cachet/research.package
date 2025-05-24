part of '../../ui.dart';

@immutable
class RPColors extends ThemeExtension<RPColors> {
  const RPColors({
    this.primary,
    this.warningColor,
    this.backgroundGray,
    this.tabBarBackground,
    this.white,
    this.grey50,
    this.grey100,
    this.grey200,
    this.grey300,
    this.grey400,
    this.grey500,
    this.grey600,
    this.grey700,
    this.grey800,
    this.grey900,
    this.grey950,
  });

  final Color? primary;

  final Color? warningColor;

  final Color? backgroundGray;

  final Color? tabBarBackground;

  final Color? white;

  final Color? grey50;
  final Color? grey100;
  final Color? grey200;
  final Color? grey300;
  final Color? grey400;
  final Color? grey500;
  final Color? grey600;
  final Color? grey700;
  final Color? grey800;
  final Color? grey900;
  final Color? grey950;

  @override
  RPColors copyWith(
      {Color? primary,
      Color? warningColor,
      Color? backgroundGray,
      Color? tabBarBackground,
      Color? white,
      Color? grey50,
      Color? grey100,
      Color? grey200,
      Color? grey300,
      Color? grey400,
      Color? grey500,
      Color? grey600,
      Color? grey700,
      Color? grey800,
      Color? grey900,
      Color? grey950}) {
    return RPColors(
      primary: primary ?? this.primary,
      warningColor: warningColor ?? this.warningColor,
      backgroundGray: backgroundGray ?? this.backgroundGray,
      tabBarBackground: tabBarBackground ?? this.tabBarBackground,
      white: white ?? this.white,
      grey50: grey50 ?? this.grey50,
      grey100: grey100 ?? this.grey100,
      grey200: grey200 ?? this.grey200,
      grey300: grey300 ?? this.grey300,
      grey400: grey400 ?? this.grey400,
      grey500: grey500 ?? this.grey500,
      grey600: grey600 ?? this.grey600,
      grey700: grey700 ?? this.grey700,
      grey800: grey800 ?? this.grey800,
      grey900: grey900 ?? this.grey900,
      grey950: grey950 ?? this.grey950,
    );
  }

  @override
  RPColors lerp(RPColors? other, double t) {
    if (other is! RPColors) {
      return this;
    }
    return RPColors(
      primary: Color.lerp(primary, other.primary, t),
      warningColor: Color.lerp(warningColor, other.warningColor, t),
      backgroundGray: Color.lerp(backgroundGray, other.backgroundGray, t),
      tabBarBackground: Color.lerp(tabBarBackground, other.tabBarBackground, t),
      white: Color.lerp(white, other.white, t),
      grey50: Color.lerp(grey50, other.grey50, t),
      grey100: Color.lerp(grey100, other.grey100, t),
      grey200: Color.lerp(grey200, other.grey200, t),
      grey300: Color.lerp(grey300, other.grey300, t),
      grey400: Color.lerp(grey400, other.grey400, t),
      grey500: Color.lerp(grey500, other.grey500, t),
      grey600: Color.lerp(grey600, other.grey600, t),
      grey700: Color.lerp(grey700, other.grey700, t),
      grey800: Color.lerp(grey800, other.grey800, t),
      grey900: Color.lerp(grey900, other.grey900, t),
      grey950: Color.lerp(grey950, other.grey950, t),
    );
  }
}

ThemeData researchPackageTheme = ThemeData.light().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    RPColors(
      primary: const Color(0xff006398),
      warningColor: Colors.orange[500],
      backgroundGray: const Color(0xfff2f2f7),
      tabBarBackground: const Color.fromARGB(255, 227, 227, 228),
      white: const Color(0xffFFFFFF),
      grey50: const Color(0xffFCFCFF),
      grey100: const Color(0xffF2F2F7),
      grey200: const Color(0xffE5E5EA),
      grey300: const Color(0xffD1D1D6),
      grey400: const Color(0xffBABABA),
      grey500: const Color(0xff9B9B9B),
      grey600: const Color(0xff848484),
      grey700: const Color(0xff3A3A3C),
      grey800: const Color(0xff2C2C2E),
      grey900: const Color(0xff1C1C1E),
      grey950: const Color(0xff0E0E0E),
    )
  ],
  primaryColor: const Color(0xFF206FA2),
  colorScheme: const ColorScheme.light().copyWith(
      secondary: const Color(0xFFFAFAFA),
      primary: const Color(0xFF206FA2),
      tertiary: const ui.Color.fromARGB(255, 230, 230, 230)),
  //accentColor: Color(0xFFFAFAFA), //Color(0xffcce8fa),
  hoverColor: const Color(0xFFF1F9FF),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  textTheme: ThemeData.light()
      .textTheme
      .copyWith(
        bodySmall: ThemeData.light().textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
        bodyLarge: ThemeData.light().textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
        bodyMedium: ThemeData.light().textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
        titleMedium: ThemeData.light().textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
            color: const Color(0xFF206FA2)),
        titleLarge: ThemeData.light().textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
        headlineMedium: ThemeData.light().textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 30.0,
            ),
        labelLarge: ThemeData.light().textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w500, fontSize: 16.0, color: Colors.white),
      )
      .apply(
        fontFamily: 'OpenSans',
      ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);

ThemeData researchPackageDarkTheme = ThemeData.dark().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    RPColors(
      primary: const Color(0xff24B2FF),
      warningColor: Colors.orange[700],
      backgroundGray: const Color(0xff0e0e0e),
      tabBarBackground: const Color(0xffe3e3e4),
      white: const Color(0xff1C1C1E),
      grey50: const Color(0xff3A3A3C),
      grey100: const Color(0xff0E0E0E),
      grey200: const Color(0xff2C2C2E),
      grey300: const Color(0xff3A3A3C),
      grey400: const Color(0xff9B9B9B),
      grey500: const Color(0xffBABABA),
      grey600: const Color(0xffBABABA),
      grey700: const Color(0xffD1D1D6),
      grey800: const Color(0xffF2F2F7),
      grey900: const Color(0xffF2F2F7),
      grey950: const Color(0xff0E0E0E),
    )
  ],
  primaryColor: const Color(0xff81C7F3),
  colorScheme: const ColorScheme.dark().copyWith(
    secondary: const Color(0xff4C4C4C),
    primary: const Color(0xff81C7F3),
    tertiary: (const Color(0xff4C4C4C)),
  ),
  // accentColor: Color(0xff4C4C4C),
  disabledColor: const Color(0xffcce8fa),
  textTheme: ThemeData.dark()
      .textTheme
      .copyWith(
        bodySmall: ThemeData.dark().textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
        bodyLarge: ThemeData.dark().textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
        bodyMedium: ThemeData.dark().textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
        titleMedium: ThemeData.dark().textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
              color: const Color(0xff81C7F3),
            ),
        titleLarge: ThemeData.dark().textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
        headlineMedium: ThemeData.dark().textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 30.0,
            ),
        labelLarge: ThemeData.dark().textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            color: Colors.grey.shade800),
      )
      .apply(
        fontFamily: 'OpenSans',
      ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);

TextStyle visualConsentStepTileStyle = const TextStyle(
    fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: 0);

TextStyle visualConsentStepTitleStyle = const TextStyle(
    fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: 0);

TextStyle visualConsentStepSummaryStyle = const TextStyle(
    fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0);

TextStyle studyTitleStyle =
    const TextStyle(fontSize: 24, fontWeight: FontWeight.w600);

TextStyle studyDetailsInfoTitle =
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700);

TextStyle studyDetailsInfoMessage =
    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700);

TextStyle readMoreStudyStyle =
    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700);

TextStyle scoreNumberStyle = const TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    color: Color.fromRGBO(32, 111, 162, 1));

TextStyle scoreNumberStyleSmall = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: Color.fromRGBO(32, 111, 162, 1));

TextStyle scoreTextStyle =
    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700);

TextStyle aboutStudyCardTitleStyle =
    const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)
        .apply(fontFamily: 'OpenSans');

TextStyle aboutCardTitleStyle =
    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)
        .apply(fontFamily: 'OpenSans');

TextStyle aboutCardInfoStyle =
    const TextStyle(fontSize: 14, fontStyle: FontStyle.italic);

TextStyle aboutCardSubtitleStyle =
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

TextStyle aboutCardContentStyle =
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)
        .apply(fontFamily: 'OpenSans');

TextStyle aboutCardTimeAgoStyle =
    const TextStyle(fontSize: 10, fontWeight: FontWeight.w600)
        .apply(fontFamily: 'OpenSans');

TextStyle sectionTitleStyle =
    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700);

TextStyle inputFieldStyle =
    const TextStyle(fontSize: 15, color: Color(0xff707070));

TextStyle welcomeMessageStyle = const TextStyle(
    fontSize: 24, color: Color(0xff707070), fontWeight: FontWeight.bold);

TextStyle studyDescriptionStyle =
    const TextStyle(fontSize: 12, fontWeight: FontWeight.w300);

TextStyle dataCardTitleStyle = const TextStyle(
    fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 1);
TextStyle dataCardRightTitleStyle =
    const TextStyle(fontSize: 14, letterSpacing: 1);
TextStyle measuresStyle =
    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
TextStyle legendStyle =
    const TextStyle(fontSize: 12, fontWeight: FontWeight.w400);

TextStyle audioTitleStyle =
    const TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
TextStyle audioContentStyle =
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700);

TextStyle heartRateNumberStyle =
    const TextStyle(fontSize: 28, fontWeight: FontWeight.w700);
TextStyle heartRateBPMTextStyle =
    const TextStyle(fontSize: 10, fontWeight: FontWeight.w700);

TextStyle surveysCardTotalTextStyle =
    const TextStyle(fontSize: 24, fontWeight: FontWeight.w700);

TextStyle dataVizCardTitleNumber =
    const TextStyle(fontSize: 28, fontWeight: FontWeight.w700);
TextStyle dataVizCardTitleText =
    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700);
TextStyle dataVizCardBottomNumber =
    const TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
TextStyle dataVizCardBottomText =
    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700);

TextStyle deviceTitle =
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700);

TextStyle deviceSubtitle =
    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700);

TextStyle healthServiceConnectTitleStyle =
    const TextStyle(fontSize: 24, fontWeight: FontWeight.w700);

TextStyle healthServiceConnectMessageStyle =
    const TextStyle(fontSize: 22, fontWeight: FontWeight.w700);

TextStyle profileSectionStyle =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
TextStyle profileTitleStyle =
    TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
TextStyle profileActionStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

TextStyle timerStyle =
    const TextStyle(fontSize: 36, fontWeight: FontWeight.w600);

TextStyle studyNameStyle =
    const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w800);
