import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:boss_app/public.dart';

import './model/city_model.dart';

class PositionCity extends StatefulWidget {
  @override
  _PositionCityState createState() => _PositionCityState();
}

class _PositionCityState extends State<PositionCity>
    with TickerProviderStateMixin {
  List _list = [];
  int _activeIndex = 0;

  void _initData() async {
    await rootBundle.loadString('assets/images/city.json').then((ret) {
      var data = json.decode(ret.toString());
      CityModel cityList = CityModel.fromJson(data);
      setState(() {
        _list = cityList.zpData.cityList;
      });
    });
  }

  @override
  void initState() {
    _initData();
    _activeIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('城市'),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
        leading: GestureDetector(
          child: Image.asset("assets/images/icon/ic_action_close_black.png"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: InkWell(
          child: Row(
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(1334),
                width: ScreenUtil().setWidth(220),
                child: Container(
                  width: ScreenUtil().setWidth(220),
                  padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(80)),
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (BuildContext Context,int index){
                      return _leftItem(_list[index].name,isActive: index == _activeIndex ? true : false,index:index);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(1334),
                width: ScreenUtil().setWidth(530),
                child: Container(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(25.0),top:ScreenUtil().setWidth(25.0),right: ScreenUtil().setWidth(25.0)),
                    width: ScreenUtil().setWidth(530),
                    color: Color(0xFFf8f8f8),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                    _list.length >0 ? GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3,
                            mainAxisSpacing: ScreenUtil().setWidth(30.0),
                            crossAxisSpacing: ScreenUtil().setWidth(30.0),
                          ),
                          shrinkWrap: true,
                          itemCount: _list[_activeIndex].subLevelModelList.length,
                          itemBuilder: (BuildContext context,int index){
                            return _rightItem(_list[_activeIndex].subLevelModelList[index].name);
                          },
                        ) : Text("")
                      ],
                    )
                ),
              )
            ],
          ),
        )
      ),
    );
  }


  //左侧list item
  Widget _leftItem(title,{isActive = false,index = 0}){
    return GestureDetector(
      child: Container(
        height: ScreenUtil().setHeight(100),
        color: Color( isActive ? 0xFFf8f8f8 : 0xFFFFFFFF),
        child: Text(
          "$title",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(color: isActive ? Colours.app_main : Color( 0Xff747474)),
        ),
        alignment: Alignment.center,
      ),
      onTap: (){
        _leftItemTap(index);
      },
    );
  }

  _leftItemTap(int index){
    setState(() {
      _activeIndex = index;
    });
  }

  //右侧
 Widget _rightItem(title){
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Color(0XffD2D2D2), width: 1.0
            ),
            borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10.0)))
        ),
        child: Center(
          child: Text(
            "$title",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Color(0Xff6E6E6E)),
          ),
        ),
      ),
      borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(10.0)),
    );
 }
}
