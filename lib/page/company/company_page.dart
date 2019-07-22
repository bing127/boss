import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:boss_app/public.dart';

import './item/company_list.dart';

class CompanyPage extends StatefulWidget {

  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> with AutomaticKeepAliveClientMixin,TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "公司",
          style: TextStyle(
            color: Colours.text_white
          ),
        ),
        backgroundColor: Colours.app_main,
        brightness: Brightness.light,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              onPressed: (){
                // NavigatorUtils.push(context, ShopRouter.messagePage);
              },
              icon: loadAssetImage(
                "icon/ic_action_company_search",
                 width: ScreenUtil().setWidth(40.0),
                height: ScreenUtil().setWidth(40.0),
              ),
            ),
            IconButton(
              onPressed: (){
                // NavigatorUtils.push(context, SettingRouter.settingPage);
              },
              icon: loadAssetImage(
                "icon/ic_action_company_filter",
                 width: ScreenUtil().setWidth(40.0),
                height: ScreenUtil().setWidth(40.0),
              ),
            )
          ],
      ),
      body: SingleChildScrollView(
        child:  InkWell(
          child: ListBody(
            children: <Widget>[
              CompanyList(isShowGrp: true,),
              CompanyList(isShowGrp: true,),
              CompanyList(isShowGrp: true,),
              CompanyList(isShowGrp: true,),
              CompanyList(isShowGrp: true,),
              CompanyList(isShowGrp: true,),
              CompanyList(),
            ],
          ),
        ),
      )
    );

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

