import 'package:boss_app/app/app_navigator.dart';
import 'package:boss_app/page/company/company_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:boss_app/app/app_color.dart';

class CompanyList extends StatefulWidget {

  bool isShowGrp = false;

  CompanyList({Key key, this.isShowGrp = false }) : super(key: key);

  _CompanyListState createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
       color: Color(0xFFFFFFFF),
       margin: EdgeInsets.only(bottom:widget.isShowGrp ? ScreenUtil().setHeight(15.0) : 0.0),
       padding: EdgeInsets.all(ScreenUtil().setWidth(30.0)),
       child: GestureDetector(
         child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           Row(
             children: <Widget>[
               ClipRRect(
                 borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setHeight(20.0))),
                 child: Container(
                   height: ScreenUtil().setWidth(130.0),
                   width: ScreenUtil().setWidth(130.0),
                   child: Image.asset(
                       'assets/images/company.jpg',
                     fit: BoxFit.cover,
                   ),
                 ),
               ),
               Expanded(
                 flex: 1,
                 child: Container(
                   margin: EdgeInsets.only(left: ScreenUtil().setWidth(20.0)),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: <Widget>[
                       Container(
                         margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20.0)),
                         child: Text(
                           "腾讯科技(深圳)",
                           style: TextStyle(
                              color: Color(0xFF434343),
                              fontSize:ScreenUtil().setSp(32),
                            ),
                         ),
                       ),
                       Wrap(
                        runSpacing: 6.0,
                        spacing:6.0,
                        children: <Widget>[
                          Text(
                            "深圳市",
                            style: TextStyle(
                              color: Color(0xFF4B4B4B),
                              fontSize:ScreenUtil().setSp(28),
                            ),
                          ),
                          Text(
                            "南山区",
                            style: TextStyle(
                              color: Color(0xFF4B4B4B),
                              fontSize:ScreenUtil().setSp(28),
                            ),
                          ),
                          Text(
                            "科技园",
                            style: TextStyle(
                              color: Color(0xFF4B4B4B),
                              fontSize:ScreenUtil().setSp(28),
                            ),
                          )
                        ],     
                      )
                     ],
                   ),
                 ),
               )
             ],
           ),
           SizedBox(
              height: ScreenUtil().setHeight(15.0),
           ),
           Wrap(
              runSpacing: 6.0,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setHeight(6.0))),
                  child: Container(
                    padding: EdgeInsets.all(ScreenUtil().setHeight(10.0)),
                    margin: EdgeInsets.only(right: ScreenUtil().setWidth(20.0)),
                    color: Color(0xFFF8F8F8),
                    child: Text(
                    "深圳 南山区 科技园",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFFAFAFAF),
                      fontSize:ScreenUtil().setSp(22.0),
                    ),
                  ),
                  )
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setHeight(6.0))),
                  child: Container(
                    padding: EdgeInsets.all(ScreenUtil().setHeight(10.0)),
                    margin: EdgeInsets.only(right: ScreenUtil().setWidth(20.0)),
                    color: Color(0xFFF8F8F8),
                    child: Text(
                    "3-5年",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFFAFAFAF),
                      fontSize:ScreenUtil().setSp(22.0),
                    ),
                  ),
                  )
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setHeight(6.0))),
                  child: Container(
                    padding: EdgeInsets.all(ScreenUtil().setHeight(10.0)),
                    margin: EdgeInsets.only(right: ScreenUtil().setWidth(20.0)),
                    color: Color(0xFFF8F8F8),
                    child: Text(
                    "大专以上",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFFAFAFAF),
                      fontSize:ScreenUtil().setSp(22.0),
                    ),
                  ),
                  )
                ),
                ],
                ),
              SizedBox(
              height: ScreenUtil().setHeight(10.0),
           ),
               Container(
                 padding: EdgeInsets.only(top: ScreenUtil().setHeight(10.0)),
                 decoration: BoxDecoration(
                   border: Border(
                     bottom: BorderSide(
                       color: Color(0xFFF0F0F0),
                       width: ScreenUtil().setHeight(1.0)
                     )
                   )
                 ),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                   Container(
                     padding: EdgeInsets.only(top:ScreenUtil().setHeight(20.0)),
                     child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: <Widget>[
                       Text(
                         "热招:",
                         style: TextStyle(
                           color: Color(0xFFA4A4A4),
                           fontSize: ScreenUtil().setSp(23.0),
                           letterSpacing: 1.0
                         ),
                       ),
                       Text(
                         "python",
                         style: TextStyle(
                           color: Colours.app_main,
                           fontSize: ScreenUtil().setSp(23.0),
                           letterSpacing: 1.0
                         ),
                       ),
                       Text(
                         "等231个职位",
                         style: TextStyle(
                           color: Color(0xFFA4A4A4),
                           fontSize: ScreenUtil().setSp(23.0),
                           letterSpacing: 1.0
                         ),
                       )
                     ],
                   ),
                   ),
                   Container(
                     padding: EdgeInsets.only(top:ScreenUtil().setHeight(20.0)),
                     child: Icon(
                       Icons.keyboard_arrow_right,
                       color: Color(0xFFACACAC),
                     ),
                   )
                 ],
               )
         ],
       ),
       onTap: (){
         NavigatorUtils.push(context, CompanyRouter.companyDetail);
       },
       )
    );
  }
}