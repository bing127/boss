import 'package:boss_app/public.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PositionSearch extends StatefulWidget {
  PositionSearch({Key key}) : super(key: key);

  _PositionSearchState createState() => _PositionSearchState();
}

class _PositionSearchState extends State<PositionSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
        title: Container(
                width: ScreenUtil().setWidth(750),
                height: ScreenUtil().setHeight(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            "深圳",
                            style:TextStyle(
                              fontSize: ScreenUtil().setSp(30),
                            )
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              color: Color(0Xfff0f1f5),
                              height: ScreenUtil().setHeight(50),
                              width: ScreenUtil().setWidth(2),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: ScreenUtil().setHeight(40.0),
                                child: TextField(
                                    autofocus: true,
                                    maxLines: 1,
                                    cursorColor:Colours.app_main,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:"请输入职位和公司",
                                      contentPadding: const EdgeInsets.only(top: 0.0, left: 8.0, right: -16.0),
                                    ),
                                  ),
                              )
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: GestureDetector(
                        child: Text(
                          "取消",
                          style:TextStyle(
                                fontSize: ScreenUtil().setSp(30),
                              ),
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      )
                    )
                  ],
                )
          ),
        automaticallyImplyLeading: false,
      ),
    );
  }
}