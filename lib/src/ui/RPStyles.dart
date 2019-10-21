part of research_package_ui;

class RPStyles {
  static final h1 = TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static final h2 = TextStyle(fontSize: 24, fontWeight: FontWeight.w500);
  static final h3 = TextStyle(fontSize: 18, fontWeight: FontWeight.w300);

  static final bodyText = TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  static final whiteText = TextStyle(color: Colors.white);

  /// The style used in choice Answer Format questions
  static final choiceAnswerText = TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400);

  static final cachetBlue = Color(0xff61c3d9);

  /// The theme of Research Package
  static final cachetTheme = ThemeData.light().copyWith(
    accentColor: cachetBlue,
    primaryColor: cachetBlue,
  );
}
