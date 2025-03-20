part of '../../ui.dart';

class RPColors extends ThemeExtension<RPColors> {
  const RPColors({
    required this.primary,
    required this.warningColor,
    required this.grey300,
    required this.grey900,
  });

  final Color primary;
  final Color? warningColor;
  final Color grey300;
  final Color grey900;

  @override
  RPColors copyWith(
      {Color? primary, Color? warningColor, Color? grey300, Color? grey900}) {
    return RPColors(
      primary: primary ?? this.primary,
      warningColor: warningColor ?? this.warningColor,
      grey300: grey300 ?? this.grey300,
      grey900: grey900 ?? this.grey900,
    );
  }

  @override
  RPColors lerp(RPColors? other, double t) {
    if (other is! RPColors) {
      return this;
    }
    return RPColors(
      primary: Color.lerp(primary, other.primary, t)!,
      warningColor: Color.lerp(warningColor, other.warningColor, t),
      grey300: Color.lerp(grey300, other.grey300, t)!,
      grey900: Color.lerp(grey900, other.grey900, t)!,
    );
  }
}

ThemeData researchPackageTheme = ThemeData.light().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    RPColors(
      primary: const Color(0xff006398),
      warningColor: Colors.orange[500],
      grey300: const Color(0xffD1D1D6),
      grey900: const Color(0xff1C1C1E),
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
      grey300: const Color(0xff3A3A3C),
      grey900: const Color(0xffF2F2F7),
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
