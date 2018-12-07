import 'package:flutter/material.dart';

class QuestionList extends StatelessWidget {
  final questions;
  const QuestionList({@required this.questions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Text('${questions[index]}');
      },
    );
  }
}
