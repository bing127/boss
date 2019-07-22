import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:boss_app/public.dart';

class CompanyDetail extends StatefulWidget {
  CompanyDetail({Key key}) : super(key: key);

  _CompanyDetailState createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail> with TickerProviderStateMixin {
  double customHeight =  ScreenUtil().setHeight(100);
  double height = ScreenUtil().setHeight(1334);


  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: Duration(seconds: 3),vsync: this);

    Tween<double> tween = Tween(begin: 0,end: 300);
    animation = tween.animate(controller);


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "公司",
        ),
        leading: GestureDetector(
          child: Image.asset("assets/images/icon/ic_back_arrow.png"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colours.text_white,
        brightness: Brightness.light,
        elevation: 0.0,
        actions: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(40.0)),
            child: GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  Text("关注")
                ],
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(1000),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/company.jpg",
                    ),
                    fit: BoxFit.cover)),
            child: Column(),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: SingleChildScrollView(
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: ListBody(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(30.0)),
                      margin:
                          EdgeInsets.only(bottom: ScreenUtil().setHeight(60)),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "腾讯科技",
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(35.0),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(20.0)),
                                child: Text(
                                  "不需要融资 • 10000人以上 • 互联网软件",
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(20.0)),
                              width: ScreenUtil().setWidth(160),
                              height: ScreenUtil().setWidth(160),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      ScreenUtil().setWidth(50.0)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/company.jpg",
                                      ),
                                      fit: BoxFit.contain)),
                            ),
                          )
                        ],
                      ),
                    ),
                    _panelItem(
                        "公司介绍",
                        Container(
                          child: Text(
                            "到目前为止，您已经学会了如何随着时间的推移生成一系列数字，但没有任何东西被渲染到屏幕上。 要使用Animation<>对象进行渲染，请将Animation对象存储为Widget的成员，然后使用其value值来决定如何绘制。",
                            style:
                                TextStyle(height: ScreenUtil().setHeight(2.3)),
                          ),
                        )),
                    _panelItem(
                        "公司地址",
                        Container(
                          child: Text("此次为公司地图"),
                        )),
                    _panelItem(
                        "公司官网",
                        Container(
                          child: ListTile(
                            contentPadding: EdgeInsets.all(0),
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.white,
                            ),
                            title: Text(
                              "https://www.qq.com",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        isTop: false),
                    _panelItem(
                        "工商信息",
                        Container(
                          child: ListBody(
                            children: <Widget>[
                              _msgItem("公司全称", "深圳腾讯科技有限公司"),
                              _msgItem("企业法人", "马化腾"),
                              _msgItem("注册时间", "1990-01-23"),
                              _msgItem("注册资本", "50亿", isShow: false),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom:0,
             height: customHeight,
            child: Container(
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(ScreenUtil().setWidth(30.0)),
                        topRight:
                            Radius.circular(ScreenUtil().setWidth(30.0)))),
                    width: ScreenUtil().setWidth(750),
                    child: Center(
                      child: Icon(
                        Icons.touch_app,
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  onPanUpdate: (ret){
                    setState(() {
                     customHeight = height - ret.globalPosition.dy; 
                    });
                  },
                  onPanEnd: (ret){
                    var maxHeight = ScreenUtil().setHeight(1334) - ScreenUtil().setHeight(200);
                    var minHeight = ScreenUtil().setHeight(100);
                     if(customHeight >= maxHeight){
                       setState(() {
                        customHeight = maxHeight; 
                       });
                     } else if(customHeight <= minHeight) {
                       setState(() {
                        customHeight = minHeight; 
                       });
                     } else if ( customHeight >= maxHeight /2 ){
                       setState(() {
                        customHeight = maxHeight; 
                       });
                     } else if ( customHeight <= maxHeight /2 ){
                       setState(() {
                        customHeight = minHeight; 
                       });
                     }
                    
                    controller.forward();
                  },
                )),
          )
        ],
      ),
    );
  }

  Widget _msgItem(title, sub, {isShow: true}) {
    return Container(
      margin:
          EdgeInsets.only(bottom: ScreenUtil().setHeight(isShow ? 20.0 : 0.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "$title",
            style: TextStyle(color: Color(0xFFf0f1f5)),
          ),
          Text("$sub")
        ],
      ),
    );
  }

  Widget _panelItem(title, Widget wiget, {isTop: true}) {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(30.0),
          right: ScreenUtil().setWidth(30.0),
          bottom: ScreenUtil().setWidth(120.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "$title",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: ScreenUtil().setSp(40)),
          ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(isTop ? 30.0 : 0.0)),
            child: wiget,
          )
        ],
      ),
    );
  }
}
