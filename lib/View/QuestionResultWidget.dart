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
      child: buildColumn(),
    );
  }

  Column buildColumn() {
    return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(10.0),

        child: Text(
          model.titleText,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          model.resultText,
          style: TextStyle(
            fontSize: 32.0,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(model.flavorText),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
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
                              child: buildTextInSizedBox("${model.answers[Index].question}")
                          ),
                      ),
                      buildTextInSizedBox("${model.answers[Index].answer}", width: 60.0),
                    ],
                  ),
                );
            }
        ),
      ),
      Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
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
                          child: buildTextInSizedBox( "${model.history[Index].resultText}"),
                          padding: EdgeInsets.only(left: betweenTextsGap)
                        )
                      )
                    ],
                  ),
                );
              }
          ),
      ),
    ],
  );
  }

  SizedBox buildTextInSizedBox(String text, {double width = null}) {
    return SizedBox(
      height: textHeight,
      width: width,
      child: Container(
        alignment: Alignment(0.0, 0.0),
        color: Colors.white,
        child: Text(
          "${text}",
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      )
    );


  }
}