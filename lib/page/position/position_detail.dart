import 'package:boss_app/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:boss_app/public.dart';
import 'package:flutter/widgets.dart';

class PositionDetail extends StatefulWidget {
  @override
  _PositionDetailState createState() => _PositionDetailState();
}

class _PositionDetailState extends State<PositionDetail> {
  bool _isShow = false;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    _scrollController.addListener((){
      double offset = _scrollController.offset;
      if(offset > ScreenUtil().setHeight(50)){
        setState(() {
          _isShow = true;
        });
      } else {
        setState(() {
          _isShow = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            width: ScreenUtil().setWidth(250),
            alignment: Alignment.center,
            child: Text(
                _isShow ? "Python开发工程师" : "职位详情",
              overflow: TextOverflow.ellipsis,
            ),
          ),
          centerTitle: true,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: GestureDetector(
            child: Image.asset("assets/images/icon/ic_back_arrow.png"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: loadAssetImage(
                "icon/ic_action_favor_off_black",
                width: ScreenUtil().setWidth(40.0),
                height: ScreenUtil().setWidth(40.0),
              ),
            ),
            GestureDetector(
              child: Container(
                child: loadAssetImage(
                  "icon/ic_action_report_black",
                  width: ScreenUtil().setWidth(40.0),
                  height: ScreenUtil().setWidth(40.0),
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: loadAssetImage(
                  "icon/ic_action_share_black",
                  width: ScreenUtil().setWidth(40.0),
                  height: ScreenUtil().setWidth(40.0),
                )),
          ],
        ),
        body:  Stack(
            children: <Widget>[
              SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(ScreenUtil().setHeight(30.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Python开发工程师",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(35.0),
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          child: Text(
                            "8-10K",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(28.0),
                                color: Colours.app_main),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setHeight(30.0),
                        right: ScreenUtil().setHeight(30.0),
                        bottom: ScreenUtil().setHeight(30.0)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: loadAssetImage("icon/ic_location_black",
                                  width: ScreenUtil().setWidth(25)),
                              margin: EdgeInsets.only(
                                  right: ScreenUtil().setHeight(10.0)),
                            ),
                            Text(
                              "深圳•南山区",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: loadAssetImage("icon/ic_work_exp_black",
                                  width: ScreenUtil().setWidth(25)),
                              margin: EdgeInsets.only(
                                  right: ScreenUtil().setHeight(10.0)),
                            ),
                            Text(
                              "3-5年",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: loadAssetImage("icon/ic_resume_degree_black",
                                  width: ScreenUtil().setWidth(25)),
                              margin: EdgeInsets.only(
                                  right: ScreenUtil().setHeight(10.0)),
                            ),
                            Text(
                              "博士",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    color: Color(0XffF4F4F4),
                  ),
                  _picText("米雪儿","腾讯科技•HR"),
                  Divider(
                    height: 1.0,
                    color: Color(0XffF4F4F4),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(ScreenUtil().setHeight(30.0)),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "职位详情",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(35.0)),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        Container(
                          margin:
                          EdgeInsets.only(top: ScreenUtil().setHeight(25.0)),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "岗位职责",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(28),
                                      color: Color(0xFF8F8F8F)),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(25.0)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    _itemList("1. 学习探索能力强，有较强自我驱动能力"),
                                    _itemList("2. 精通python或go语言，有良好的编程测试发布规范"),
                                    _itemList("3. 3年以上Linux平台实际开发经验"),
                                    _itemList("4. 熟悉常用的算法，数据结构，多线程编程"),
                                    _itemList("5. 分布式系统，网络方面相关开发经验优先"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    color: Color(0XffF4F4F4),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(ScreenUtil().setHeight(30.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "技能要求",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(35.0)),
                          ),
                          alignment: Alignment.centerLeft,
                          margin:
                          EdgeInsets.only(bottom: ScreenUtil().setHeight(20.0)),
                        ),
                        Wrap(
                          children: <Widget>[
                            _itemTag('Flask'),
                            _itemTag('爬虫'),
                            _itemTag('Nginx'),
                            _itemTag('Redis'),
                            _itemTag('React'),
                            _itemTag('tornado'),
                          ],
                        )
                      ],
                    ),
                  ),
                  _picText("腾讯科技(深圳)","已上市•10000人以上•科技",isRadius: false),
                  SizedBox(
                    height: ScreenUtil().setHeight(120),
                  ),
                ],
              ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child:Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(ScreenUtil().setWidth(20.0)),
                  child: Container(
                  height: ScreenUtil().setHeight(100),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10.0))),
                    color: Colours.app_main,
                  ),
                  child: Text(
                      "立即沟通"
                  ),
                ),
                ),
              )
            ],
          ),

    );
  }

  Widget _itemList(title) {
    return Container(
      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20.0)),
      child: Text(
        "$title",
        style: TextStyle(
            fontSize: ScreenUtil().setSp(28), color: Color(0xFF8F8F8F)),
      ),
    );
  }

  Widget _itemTag(title) {
    return ClipRRect(
      borderRadius:
          BorderRadius.all(Radius.circular(ScreenUtil().setHeight(10.0))),
      child: Container(
        padding: EdgeInsets.all(ScreenUtil().setWidth(15.0)),
        margin: EdgeInsets.only(
            right: ScreenUtil().setWidth(20.0),
            bottom: ScreenUtil().setWidth(20.0)),
        decoration: BoxDecoration(
            color: Color(0XffFFFFFF),
            border: Border.all(color: Color(0XffD2D2D2), width: 1.0),
            borderRadius:
                BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10.0)))),
        child: Text(
          "$title",
          style: TextStyle(color: Color(0Xff7B7B7B)),
        ),
      ),
    );
  }

  Widget _picText(title,sub,{isRadius = true}) {
    String pic = "assets/images/avatar.jpg";
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(ScreenUtil().setHeight(30.0)),
      child: Row(
        children: <Widget>[
          isRadius ? CircleAvatar(
            backgroundImage: AssetImage(
                pic
            ),
            radius: ScreenUtil().setWidth(isRadius ? 60.0 : 10.0),
          ) : Container(
            child: Image.asset(
                "${pic}",
                fit: BoxFit.cover,
            ),
            width: ScreenUtil().setWidth(120.0),
            height: ScreenUtil().setWidth(120.0),
          ),
          Expanded(
            flex: 1,
            child: ListTile(
                title: Container(
                  margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20.0)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text("$title"),
                        margin:
                            EdgeInsets.only(right: ScreenUtil().setWidth(10.0)),
                      ),
                      Text(
                        isRadius ? "今日活跃" : "",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(25.0),
                          color: Color(0XffA0A0A0),
                        ),
                      )
                    ],
                  ),
                ),
                subtitle: Text("$sub"),
                trailing: Container(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: ScreenUtil().setSp(35.0),
                    color: Color(0xffC6C6C6),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
