part of research_package_ui;

class RPUIInstructionStep extends StatefulWidget {
  String title;
  String detailText;
  String footnote;
  String text;
  Image image;

  RPUIInstructionStep({
    @required this.title,
    @required this.text,
    this.detailText,
    this.footnote,
    this.image,
  });

  @override
  _RPUIInstructionStepState createState() => _RPUIInstructionStepState();
}

class _RPUIInstructionStepState extends State<RPUIInstructionStep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instruction Step"),
      ),
      body: Container(
        color: Colors.yellowAccent,
      ),
    );
  }
}
