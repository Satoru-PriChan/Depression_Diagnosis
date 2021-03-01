import 'package:depression_diagnosis/View/QuestionWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'QuestionResultModel.dart';

class QuestionResultWidget extends StatelessWidget {

  final QuestionResultModel model;
  static const double textHeight = 25.0;
  static const double betweenTextsGap = 3.0;

  const QuestionResultWidget({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: buildWholeScreenList(),
    );
  }

  ListView buildWholeScreenList() {
    return ListView(
    children: <Widget>[
      Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            model.titleText,
            style: TextStyle(
              fontSize: 24.0,

            ),
            maxLines: 1,
          ),
        )
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          model.resultText,
          style: TextStyle(
            fontSize: 28.0,
          ),
          maxLines: 3,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
            model.flavorText,
            maxLines: 4,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: buildAnswersListView(),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: buildHistoryListView(),
      ),
    ],
  );
  }

  ListView buildAnswersListView() {
    return ListView.builder(
          shrinkWrap: true,
          itemCount: model.answers.length,
          itemBuilder: (BuildContext ctxt, int Index) {
            return
              Container(
                color: Colors.green,
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                child: Row(
                  children: [
                    buildTextInSizedBox((Index + 1).toString(), width: 20.0),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(left: betweenTextsGap, right: betweenTextsGap),
                            child: buildTextInSizedBox(
                                "${model.answers[Index].question}",
                                maxLinesCount: 2
                            )
                        ),
                    ),
                    buildTextInSizedBox(
                        "${model.answers[Index].answer}",
                        width: 60.0,
                        maxLinesCount: 2),
                  ],
                ),
              );
          }
      );
  }

  ListView buildHistoryListView() {
    return ListView.builder(
            shrinkWrap: true,
            itemCount: model.history.length,
            itemBuilder: (BuildContext ctxt, int Index) {
              return Container(
                color: Colors.lightGreen,
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                child: Row(
                  children: [
                    buildTextInSizedBox("${model.history[Index].date}", width: 70.0),
                    Expanded(child: Padding(
                        child: buildTextInSizedBox(
                            "${model.history[Index].resultText}",
                            maxLinesCount: 2
                        ),
                        padding: EdgeInsets.only(left: betweenTextsGap)
                      )
                    )
                  ],
                ),
              );
            }
        );
  }

  SizedBox buildTextInSizedBox(String text, { double width = null, int maxLinesCount = 1 }) {
    return SizedBox(
      width: width,
      child: Container(
        alignment: Alignment(0.0, 0.0),
        color: Colors.white,
        child: Text(
          "${text}",
          textAlign: TextAlign.center,
          maxLines: maxLinesCount,
        ),
      )
    );
  }
}