import 'dart:core';
import 'package:depression_diagnosis/View/QuestionWidgetModel.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {

  QuestionWidgetModel model;

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {

  List<int> _selectedItems = List<int>();

  @override
  Widget build(BuildContext context) {

    final double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
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
                  color: (_selectedItems.contains(index) ? Colors.blue.withOpacity(0.5) : Colors.transparent),
                  child: buildListTile(index),
                );
              }),
        ],
      ),
    );
  }

  Text buildQuestionText() {
    return Text(
            widget.model.question,
            maxLines: 3, 
            style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
            ),
        );
  }

  ListTile buildListTile(int index) {
    return ListTile(
      title: Text(
        widget.model.answers[index],
        maxLines: 1,
      ),
      onTap: (){
        if(_selectedItems.contains(index)){
          //選択解除
          setState((){
            _selectedItems.removeWhere((val) => val == index);
          });
        } else {
          // 選択できるのは最大maxSelectionCount個まで
          if (widget.model.maxSelectionCount <= _selectedItems.length) {
            //選択解除 & 選択
            setState(() {
              _selectedItems.removeAt(0);
              _selectedItems.add(index);
            });
          } else {
            //選択
            setState(() {
              _selectedItems.add(index);
            });
          }
        }
        },
    );
  }
}