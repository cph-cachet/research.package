part of research_package_ui;

class RPStyles {
  static const H1 = TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600);
  static const H2 = TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w400);
  static const H3 = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w200);

  static const bodyText = TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200);
  static const whiteText = TextStyle(color: Colors.white);
  static const choiceAnswerText = TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300);

  static const cachetBlue = Color(0xff61c3d9);

  static Widget RPAppBar({String text}) {
    return AppBar(backgroundColor: cachetBlue, title: Text(text));
  }

  static final cachetTheme = ThemeData.light().copyWith(
    accentColor: cachetBlue,
    primaryColor: cachetBlue,
  );
}
