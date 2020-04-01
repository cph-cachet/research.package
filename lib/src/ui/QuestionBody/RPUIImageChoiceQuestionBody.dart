part of research_package_ui;

class RPUIImageChoiceQuestionBody extends StatefulWidget {
  final RPImageChoiceAnswerFormat answerFormat;
  final Function(dynamic) onResultChance;

  RPUIImageChoiceQuestionBody(this.answerFormat, this.onResultChance);

  @override
  _RPUIImageChoiceQuestionBodyState createState() =>
      _RPUIImageChoiceQuestionBodyState();
}

class _RPUIImageChoiceQuestionBodyState
    extends State<RPUIImageChoiceQuestionBody> with AutomaticKeepAliveClientMixin<RPUIImageChoiceQuestionBody> {
  String _errorMessage;
  RPImageChoice _selectedItem;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    RPLocalizations locale = RPLocalizations.of(context);
    String text = (locale?.translate(_selectedItem?.description) ??
            _selectedItem?.description) ??
        (locale?.translate('Select an image') ?? 'Select an image');
    return Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildList(context, widget.answerFormat.choices),
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ));
  }

  Row _buildList(BuildContext context, List<RPImageChoice> items) {
    List<Widget> list = [];
    items.forEach(
      (item) => list.add(
        InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            setState(() {
              _selectedItem = item == _selectedItem ? null : item;
            });
            widget.onResultChance(_selectedItem);
          },
          child: Container(
            // Highlighting of chosen answer
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(5 * 25 / items.length)),
              border: Border.all(
                color: _selectedItem == item ? Colors.blue : Colors.transparent,
                width: 3,
              ),
            ),
            // Scaling item size with number of choices
            // Max size is 125
            padding: EdgeInsets.all(10 / items.length),
            width:
                (MediaQuery.of(context).size.width * 0.8) / items.length > 125
                    ? 125
                    : MediaQuery.of(context).size.width * 0.8 / items.length,
            height:
                (MediaQuery.of(context).size.width * 0.8) / items.length > 125
                    ? 125
                    : MediaQuery.of(context).size.width * 0.8 / items.length,
            child: item.image,
          ),
        ),
      ),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: list,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
