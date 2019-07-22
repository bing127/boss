import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PositionAdd extends StatefulWidget {
  PositionAdd({Key key}) : super(key: key);

  _PositionAddState createState() => _PositionAddState();
}

class _PositionAddState extends State<PositionAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
        leading:GestureDetector(
          child: Image.asset("assets/images/icon/ic_back_arrow.png"),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}