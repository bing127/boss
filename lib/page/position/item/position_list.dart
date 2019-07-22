import 'package:flutter/material.dart';
import 'package:collection/equality.dart';
import 'package:boss_app/app/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:boss_app/utils/image.dart';
import '../position_router.dart';
import 'package:boss_app/public.dart';

class PositionList extends StatefulWidget {
  bool isShowGrp = false;
  int index = 0;

  PositionList({Key key, this.isShowGrp = false, this.index}) : super(key: key);

  _PositionListState createState() => _PositionListState();
}

class _PositionListState extends State<PositionList>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return GestureDetector(
      onTap: (){
        NavigatorUtils.push(context, PositionRouter.positionDetail);
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(ScreenUtil().setWidth(30.0)),
            margin: EdgeInsets.only(
                bottom: widget.isShowGrp ? ScreenUtil().setHeight(15.0) : 0.0,
                top: widget.index == 0 ? ScreenUtil().setHeight(80.0) : 0.0),
            color: Colours.text_white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "python工程师",
                      style: TextStyle(
                          color: Color(0xFF434343),
                          fontSize: ScreenUtil().setSp(35),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '5-10k',
                      style: TextStyle(
                        color: Colours.app_main,
                        fontSize: ScreenUtil().setSp(30.0),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(15.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "腾讯科技(深圳) 上市",
                      style: TextStyle(
                        color: Color(0xFF434343),
                        fontSize: ScreenUtil().setSp(25.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(15.0),
                ),
                Wrap(
                  runSpacing: 6.0,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().setHeight(6.0))),
                        child: Container(
                          padding: EdgeInsets.all(ScreenUtil().setHeight(10.0)),
                          margin:
                          EdgeInsets.only(right: ScreenUtil().setWidth(20.0)),
                          color: Color(0xFFF8F8F8),
                          child: Text(
                            "深圳 南山区 科技园",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFFAFAFAF),
                              fontSize: ScreenUtil().setSp(22.0),
                            ),
                          ),
                        )),
                    ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().setHeight(6.0))),
                        child: Container(
                          padding: EdgeInsets.all(ScreenUtil().setHeight(10.0)),
                          margin:
                          EdgeInsets.only(right: ScreenUtil().setWidth(20.0)),
                          color: Color(0xFFF8F8F8),
                          child: Text(
                            "3-5年",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFFAFAFAF),
                              fontSize: ScreenUtil().setSp(22.0),
                            ),
                          ),
                        )),
                    ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().setHeight(6.0))),
                        child: Container(
                          padding: EdgeInsets.all(ScreenUtil().setHeight(10.0)),
                          margin:
                          EdgeInsets.only(right: ScreenUtil().setWidth(20.0)),
                          color: Color(0xFFF8F8F8),
                          child: Text(
                            "大专以上",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFFAFAFAF),
                              fontSize: ScreenUtil().setSp(22.0),
                            ),
                          ),
                        )),
                    Row(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/avatar.jpg",
                              ),
                              radius: ScreenUtil().setWidth(30.0),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: loadAssetImage(
                                "icon/ic_authenticated_tag",
                                width: ScreenUtil().setWidth(25.0),
                                height: ScreenUtil().setWidth(25.0),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin:
                          EdgeInsets.only(left: ScreenUtil().setWidth(10.0)),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "张无忌",
                                style: TextStyle(
                                  color: Color(0xFF585858),
                                  fontSize: ScreenUtil().setSp(22.0),
                                ),
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(5.0),
                              ),
                              Text(
                                "•",
                                style: TextStyle(
                                  color: Color(0xFF585858),
                                  fontSize: ScreenUtil().setSp(22.0),
                                ),
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(5.0),
                              ),
                              Text(
                                "Python高级开发工程师",
                                style: TextStyle(
                                  color: Color(0xFF585858),
                                  fontSize: ScreenUtil().setSp(22.0),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
