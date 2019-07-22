import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:boss_app/public.dart';
import 'package:flutter/services.dart';

import './item/position_list.dart';
import 'position_router.dart';

class PositionPage extends StatefulWidget {
  PositionPage({Key key}) : super(key: key);

  _PositionPageState createState() => _PositionPageState();
}

class _PositionPageState extends State<PositionPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Node.js",
            style: TextStyle(color: Colours.text_white),
          ),
          backgroundColor: Colours.app_main,
          brightness: Brightness.dark,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                NavigatorUtils.push(context, PositionRouter.positionAdd);
              },
              icon: loadAssetImage(
                "icon/ic_filter_find_add",
                width: ScreenUtil().setWidth(40.0),
                height: ScreenUtil().setWidth(40.0),
              ),
            ),
            IconButton(
              onPressed: () {
                NavigatorUtils.push(context, PositionRouter.positionSearch);
              },
              icon: loadAssetImage(
                "icon/ic_action_company_search",
                width: ScreenUtil().setWidth(40.0),
                height: ScreenUtil().setWidth(40.0),
              ),
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return PositionList(isShowGrp: true, index: index);
              },
              itemCount: 50,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: ScreenUtil().setHeight(80.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color(0xFFF0F0F0),
                          width: ScreenUtil().setHeight(1.0))),
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(30.0),
                    right: ScreenUtil().setWidth(30.0)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                right: ScreenUtil().setWidth(30.0)),
                            child: Text(
                              "推荐",
                              style: TextStyle(color: Color(0xFF000000)),
                            ),
                          ),
                          Text(
                            "最新",
                            style: TextStyle(color: Color(0xFF5D5D5D)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(10.0)),
                                color: Color(0xffF6F6F6),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        NavigatorUtils.push(context,
                                            PositionRouter.positionCity);
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            "深圳",
                                            style: TextStyle(
                                                color: Color(0xFF656565)),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(0xFFC3C3C3),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          SizedBox(
                            width: ScreenUtil().setWidth(30.0),
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                  padding: EdgeInsets.only(
                                      left: ScreenUtil().setWidth(10.0)),
                                  color: Color(0xffF6F6F6),
                                  child: GestureDetector(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "筛选",
                                          style: TextStyle(
                                              color: Color(0xFF656565)),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Color(0xFFC3C3C3),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      NavigatorUtils.push(context,
                                          PositionRouter.positionFilter);
                                    },
                                  )))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
