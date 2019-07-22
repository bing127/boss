import 'package:flutter/material.dart';
import 'package:boss_app/widgets/state_layout.dart';

class WidgetNotFound extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title:Text("页面不存在"),
      ),
      body: StateLayout(
        type: StateType.account,
        hintText: "页面不存在",
      ),
    );
  }
}
