import 'dart:core';
import 'package:depression_diagnosis/View/QuestionWidgetModel.dart';
import 'package:flutter/material.dart';

import 'Protocol/BaseWidgetProtocol.dart';

class QuestionWidget extends StatefulWidget with BaseWidgetProtocol {

  QuestionWidgetModel model;

  QuestionWidget(this.model);

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {

  List<int> _selectedItems = List<int>();

  @override
  Widget build(BuildContext context) {

    final double deviceWidth = MediaQuery.of(context).size.width;

    return widget.wrapWidget([buildListView(deviceWidth, context)]);
  }

  ListView buildListView(double deviceWidth, BuildContext context) {
    return ListView(
    children: <Widget>[
      Container(
        child: Column(
        children: [
        Image.asset(
        widget.model.imageName,
        width: deviceWidth - 10,
        height: deviceWidth - 10
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: buildQuestionText(),
        ),
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: widget.model.answers.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Container(
                    //選択されたアイテムを色付け
                  color: (_selectedItems.contains(index) ? Colors.blue.withOpacity(0.5) : Colors.white70),
                  child: buildListTile(index, context),
                );
          }),
        ],
      ),
    )
   ],
  );
  }

  Text buildQuestionText() {
    return Text(
            widget.model.question,
            maxLines: 4,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
            ),
        );
  }

  ListTile buildListTile(int index, BuildContext context) {
    return ListTile(
      title: Text(
        widget.model.answers[index],
        maxLines: 4,
      ),
      onTap: (){
        if(_selectedItems.contains(index)){
          //選択解除
          setState((){
            _selectedItems.removeWhere((val) => val == index);
          });
        } else {
          //選択
          if (widget.model.maxSelectionCount > _selectedItems.length) {
            setState(() {
              _selectedItems.add(index);
            });
          }

          //最大まで選択し終わった場合
          if (widget.model.maxSelectionCount <= _selectedItems.length) {
            //通知
            widget.model.selectionFinished(
                _selectedItems,
                _selectedItems.map((index) => widget.model.answers[index]).toList(),
                context,
            );
          }
        }
      },
    );
  }
}