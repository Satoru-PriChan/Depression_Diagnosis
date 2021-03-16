import 'package:flutter/material.dart';

mixin BaseWidgetProtocol {
  Scaffold wrapWidget(List<Widget> children) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Stack(
        children: children,
      ),
    );
  }
}