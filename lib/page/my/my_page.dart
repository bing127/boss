import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:boss_app/public.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin,TickerProviderStateMixin{

  ScrollController scrollController = ScrollController();
  double navAlpha = 0.0;
  var _user;
  var _userMsg = [
    {
      'title':'863',
      'sub':'沟通过'
    },
    {
      'title':'2',
      'sub':'待面试'
    },
    {
      'title':'36',
      'sub':'已投简历'
    },
    {
      'title':'12',
      'sub':'收藏'
    }
  ];

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      double offset = scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offset < 100) {
        setState(() {
          navAlpha = 1 - (100 - offset) / 100;
        });
      } else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }
    });

    setState(() {
      _user = {
         "name":'张三儿',
         "photo":'assets/images/avatar.jpg'
      };
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness:Brightness.dark,
        title: Opacity(
          opacity:navAlpha,
          child: Text(
            "${_user['name']}",
            style: TextStyle(
              color: Colours.text_white
            ),
          ),
        ),
        backgroundColor: Colours.app_main,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              onPressed: (){
                // NavigatorUtils.push(context, ShopRouter.messagePage);
              },
              icon: loadAssetImage(
                "icon/ic_action_pc",
                 width: ScreenUtil().setWidth(60.0),
                height: ScreenUtil().setWidth(60.0),
              ),
            ),
            IconButton(
              onPressed: (){
                // NavigatorUtils.push(context, SettingRouter.settingPage);
              },
              icon: loadAssetImage(
                "icon/ic_general_settings",
                width: ScreenUtil().setWidth(80.0),
                height: ScreenUtil().setWidth(80.0),
              ),
            )
          ],
      ),
      body: InkResponse(
        highlightColor: Colors.transparent,
        radius: 0.0,
        child: SingleChildScrollView(
        controller: scrollController,
          child: InkResponse(
          child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(300),
              color: Colours.app_main,
              child: Column(
                children: <Widget>[
                  Container(
                        child: ListTile(
                          contentPadding: EdgeInsets.only(top: ScreenUtil().setHeight(0.0),left: ScreenUtil().setHeight(30.0),right: ScreenUtil().setHeight(30.0)),
                          title: Container(
                            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30.0)),
                            child: Text(
                              '${_user['name']}',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(40.0),
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                          ),
                          subtitle:Container(
                            child: Row(
                              children: <Widget>[
                                Text("我的在线简历",
                                style: TextStyle(
                                  color: Colors.white,
                                ),),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.white,
                                  size: ScreenUtil().setHeight(35.0),
                                )
                              ],
                            ),
                          ),
                          trailing: Container(
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                "${_user['photo']}",
                              ),
                              radius: ScreenUtil().setHeight(50.0),
                            ),
                          ),
                      ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(20.0)),
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(10.0)),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount:_userMsg.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _userMsg.length,
                        childAspectRatio: 1.5
                      ), itemBuilder: (BuildContext context, int index) {
                        return  _itemTop(_userMsg[index]['title'],_userMsg[index]['sub']);
                      },
                    ),
                  )
                ],
              ),
            ),
            _itemCell(title: '求职简历',sub: '更多'),
            Container(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(40.0),right: ScreenUtil().setWidth(40.0)),
              color: Colors.white,
              child: InkWell(
                child: GridView(
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing:10.0,
                    childAspectRatio: 2,
                ),
              children: <Widget>[
                _itemGrid('简历刷新', '提升简历活跃', 'icon/icon_resumex'),
                _itemGrid('竞争力分析器', '洞悉职业竞争', 'icon/icon_contend'),
              ],
            ),
              ) 
            ),
            _itemCell(title: '附件简历',sub: '已上传1份',icon: 'icon/ic_open_gallery'),
            Divider(
              height: ScreenUtil().setHeight(2.0),
              color: Color(0xffF9F9F9),
            ),
            _itemCell(title: '管理求职意向',sub: '在职-暂不考虑',icon: 'icon/ic_share_wechat'),
            Divider(
              height: ScreenUtil().setHeight(2.0),
              color: Color(0xffF9F9F9),
            ),
            _itemCell(title: '个人主页',sub: '',icon: 'icon/ic_share_colleague'),
            Divider(
              height: ScreenUtil().setHeight(2.0),
              color: Color(0xffF9F9F9),
            ),
            _itemCell(title: '牛人回答',sub: '',icon: 'icon/ic_share_sms'),
            Divider(
              height: ScreenUtil().setHeight(2.0),
              color: Color(0xffF9F9F9),
            ),
            _itemCell(title: '关注公司',sub: '',icon: 'icon/ic_share_sms'),
            Divider(
              height: ScreenUtil().setHeight(2.0),
              color: Color(0xffF9F9F9),
            ),
            _itemCell(title: '提升简历排名',sub: '',icon: 'icon/ic_share_sms'),
            Divider(
              height: ScreenUtil().setHeight(2.0),
              color: Color(0xffF9F9F9),
            ),
            _itemCell(title: '钱包',sub: '',icon: 'icon/ic_share_sms'),
            Divider(
              height: ScreenUtil().setHeight(2.0),
              color: Color(0xffF9F9F9),
            ),
            _itemCell(title: '帮助与反馈',sub: '',icon: 'icon/ic_share_sms'),
          ],
        ),
        ),
        ),
      )
    );
  }


  Widget _itemTop(title,sub){
    return Column(
      children: <Widget>[
        Container(
          child: Text(
            "$title",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(40),
              fontWeight: FontWeight.bold
            ),
          ),
          padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(25.0)),
        ),
        Text("$sub")
      ],
    );
  }

  Widget _itemGrid(title,sub,img){
    return  Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colours.text_white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFF7F7F7), 
                          offset: Offset(5.0, 5.0),
                          blurRadius: 10.0, 
                          spreadRadius: 2.0
                        ), 
                      ]
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${title}',
                              style: TextStyle(
                                color: Color(0xFF3E3E3E)
                              ),
                            ),
                            Container(
                              child: Text(
                              '${sub}',
                              style: TextStyle(
                                color: Color(0xFFA2A2A2),
                                fontSize: ScreenUtil().setSp(23.0)
                              ),
                            ),
                            margin: EdgeInsets.only(top: ScreenUtil().setHeight(15.0)),
                            )
                          ],
                        ),
                        )
                      ),
                      Container(
                        child: Center(
                            child:loadAssetImage(
                                  "${img}",
                                  fit: BoxFit.cover,
                                  width: ScreenUtil().setWidth(100.0)
                                ),
                          ),
                      )
                    ],
                  ),
                );
  }

  Widget _itemCell({title,icon=null,sub}){
    return Container(
      color: Colors.white,
      child: ListTile(
              title: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only( right:icon!=null ? ScreenUtil().setWidth(20.0) : 0.0 ),
                      child:icon !=null ? loadAssetImage(
                        '${icon}',
                        width: ScreenUtil().setWidth(40.0),
                        height: ScreenUtil().setWidth(40.0)
                      ) : Text(''),
                    ),
                    Text("${title}")
                  ],
                ),
              ),
              trailing: Container(
                width: ScreenUtil().setWidth(300.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,  
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "${sub}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFFC8C8C8),
                        fontSize: ScreenUtil().setSp(28.0)
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xFFC8C8C8),
                    )
                  ],
              ),
              )
            ),
    );
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  
}