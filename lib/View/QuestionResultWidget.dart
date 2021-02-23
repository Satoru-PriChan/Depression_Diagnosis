import 'package:depression_diagnosis/View/QuestionWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'QuestionResultModel.dart';

class QuestionResultWidget extends StatelessWidget {

  final QuestionResultModel model;

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
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    children: [
                      Text(
                        "${Index + 1}",
                        style: TextStyle(backgroundColor: Colors.white),
                      ),
                      Text(
                          "${model.answers[Index].question}",
                        style: TextStyle(backgroundColor: Colors.white),
                      ),
                      Text(
                          "${model.answers[Index].answer}",
                        style: TextStyle(backgroundColor: Colors.white),
                      ),
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
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    children: [
                      Text(
                          "${model.history[Index].date}",
                          style: TextStyle(backgroundColor: Colors.white),
                      ),
                      Text(
                          "${model.history[Index].resultText}",
                        style: TextStyle(backgroundColor: Colors.white),
                      ),
                    ],
                  ),
                );
              }
          ),
      ),
    ],
  );
  }
}