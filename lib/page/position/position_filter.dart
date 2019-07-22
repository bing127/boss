import 'package:boss_app/public.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PositionFilter extends StatefulWidget {
  @override
  _PositionFilterState createState() => _PositionFilterState();
}

class _PositionFilterState extends State<PositionFilter> {
  var _list = [
    {
      'tag':'学历要求',
      'children':[
        {
          'tag':'全部'
        },
        {
          'tag':'初中及以下'
        },
        {
          'tag':'中专/中技'
        },
        {
          'tag':'高中'
        },
        {
          'tag':'大专'
        },
        {
          'tag':'本科'
        },
        {
          'tag':'硕士'
        },
        {
          'tag':'博士'
        }
      ]
    },
    {
      'tag':'薪资待遇',
      'children':[
        {
          'tag':'全部'
        },
        {
          'tag':'3K以下'
        },
        {
          'tag':'3-5K'
        },
        {
          'tag':'5-10K'
        },
        {
          'tag':'10-20K'
        },
        {
          'tag':'20-50K'
        },
        {
          'tag':'50K以上'
        }
      ]
    },
    {
      'tag':'经验要求',
      'children':[
        {
          'tag':'全部'
        },
        {
          'tag':'在校生'
        },
        {
          'tag':'应届生'
        },
        {
          'tag':'1年以内'
        },
        {
          'tag':'1-3年'
        },
        {
          'tag':'3-5年'
        },
        {
          'tag':'5-10年'
        },
        {
          'tag':'10年以上'
        }
      ]
    },
    {
      'tag':'公司规模',
      'children':[
        {
          'tag':'全部'
        },
        {
          'tag':'0-20人'
        },
        {
          'tag':'20-99人'
        },
        {
          'tag':'100-499人'
        },
        {
          'tag':'500-999人'
        },
        {
          'tag':'1000-9999人'
        },
        {
          'tag':'10000人以上'
        }
      ]
    },
    {
      'tag':'融资阶段',
      'children':[
        {
          'tag':'全部'
        },
        {
          'tag':'未融资'
        },
        {
          'tag':'天使轮'
        },
        {
          'tag':'A轮'
        },
        {
          'tag':'B轮'
        },
        {
          'tag':'C轮'
        },
        {
          'tag':'D轮及以上'
        },
        {
          'tag':'已上市'
        },
        {
          'tag':'不需要融资'
        }
      ]
    },
    {
      'tag':'行业分类',
      'children':[
        {
          'tag':'全部'
        },
        {
          'tag':'电子商务'
        },
        {
          'tag':'游戏'
        },
        {
          'tag':'媒体'
        },
        {
          'tag':'广告营销'
        },
        {
          'tag':'数据服务'
        },
        {
          'tag':'医疗健康'
        },
        {
          'tag':'生活服务'
        },
        {
          'tag':'020'
        },
        {
          'tag':'旅游'
        },
        {
          'tag':'分类信息'
        },
        {
          'tag':'音乐/视频/阅读'
        },
        {
          'tag':'在线教育'
        },
        {
          'tag':'社交网络'
        },
        {
          'tag':'人力资源服务'
        },
        {
          'tag':'企业服务'
        },
        {
          'tag':'信息安全'
        },
        {
          'tag':'智能硬件'
        },
        {
          'tag':'移动互联网'
        },
        {
          'tag':'互联网'
        },
        {
          'tag':'计算机软件'
        },
        {
          'tag':'通信/网络设备'
        },
        {
          'tag':'广告/公关/会展'
        },
        {
          'tag':'互联网金融'
        },
        {
          'tag':'物流/仓储'
        },
        {
          'tag':'贸易/进出口'
        },
        {
          'tag':'咨询'
        },
        {
          'tag':'工程施工'
        },
        {
          'tag':'汽车生产'
        },
        {
          'tag':'其他行业'
        }
      ]
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('筛选'),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
        leading:GestureDetector(
          child: Image.asset("assets/images/icon/ic_action_close_black.png"),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body:Stack(
        children: <Widget>[
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _list.length,
              itemBuilder: (BuildContext content,index){
                return _itemList(item:_list[index],isActive: true);
              },
            ),
            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(150)),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: ScreenUtil().setHeight(150),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(25.0),right: ScreenUtil().setWidth(25.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(750)/2.7,
                    height: ScreenUtil().setHeight(80),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Color(0xFFF5F5F5),
                    ),
                    child: Text(
                      "取消",
                      style: TextStyle(
                          color:  Colors.black,
                          fontSize: ScreenUtil().setSp(28.0)
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30.0)),
                      height: ScreenUtil().setHeight(80),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colours.app_main,
                      ),
                      child: Text(
                        "确定",
                        style: TextStyle(
                            color:  Colors.white,
                            fontSize: ScreenUtil().setSp(28.0)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }



  Widget _itemList({item = null,isActive = true}){
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(25.0)),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20.0)),
            child: Text(
              '${item['tag']}',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(35.0),
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          InkWell(
              child:  GridView.builder(
                shrinkWrap: true,
                physics: new NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.6,
                    mainAxisSpacing:8.0,
                    crossAxisSpacing: 8.0
                ),
                itemCount: item['children'].length,
                itemBuilder: (BuildContext context,index){
                  return _itemGrid(index,item['children'][index]);
                },
              ),
    )
        ],
      ),
    );
  }

  Widget _itemGrid(index,item){
    var isActive = index == 0 ? true :false;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Color(isActive ? 0xFFFFFFFF : 0xFFF5F5F5),
          border: Border.all(color: isActive ? Colours.app_main : Colours.text_white,width: 1.0)
      ),
      child: Text(
        "${item['tag']}",
        style: TextStyle(
            color: isActive ? Colours.app_main : Colors.black,
            fontSize: ScreenUtil().setSp(28.0)
        ),
      ),
    );
  }
}
