import 'package:boss_app/page/msg/msg_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:boss_app/public.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MsgPage extends StatefulWidget {
  MsgPage({Key key}) : super(key: key);

  _MsgPageState createState() => _MsgPageState();
}

class _MsgPageState extends State<MsgPage>  with AutomaticKeepAliveClientMixin,TickerProviderStateMixin {
  var _list = [];

  final SlidableController slidableController = SlidableController();

  @override
  void initState() { 
    super.initState();
    for(var i=0;i<=100;i++){
      var str = {
        "title":'张三${i}'
      };
      setState(() {
       _list.add(str); 
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "聊天",
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
                // NavigatorUtils.push(context, SettingRouter.settingPage);
              },
              icon: loadAssetImage(
                "icon/ic_action_notify",
                 width: ScreenUtil().setWidth(43.0),
                 height: ScreenUtil().setWidth(43.0),
              ),
            )
          ],
      ),
      body: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (_, index){
                  return InkWell(
                    child: msgList(isShowGrp:index == _list.length -1 ? false : true,userList:_list[index],index:index),
                  );
            }
      ),
    );

  }



  Widget msgList({isShowGrp = true,userList,index}){
    return Container(
      decoration: BoxDecoration(
                   border: Border(
                     bottom: BorderSide(
                       color: Color(0xFFF0F0F0),
                       width: ScreenUtil().setHeight( isShowGrp ? 1.0 : 0.0)
                     )
                   )
                 ),
      child: Slidable(
          key: ValueKey(index),
          controller: slidableController,
          actionPane: SlidableDrawerActionPane(),
          child: Container(
            color: Colors.white,
            child: GestureDetector(
              child: ListTile(
              leading: CircleAvatar(
                 backgroundImage: AssetImage("assets/images/avatar.jpg"),
                radius: ScreenUtil().setWidth(60.0),
              ),
              title: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                          Container(
                            child: Text(
                              "${userList['title']}",
                              style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: ScreenUtil().setSp(32.0)
                              ),
                            ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: ScreenUtil().setWidth(10.0)),
                          width: ScreenUtil().setWidth(180),
                          child: Text(
                            "腾讯科技•Python高级开发工程师",
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xFFAAAAAA),
                                fontSize: ScreenUtil().setSp(28.0)
                              ),
                          ),
                        )
                       ],
                     ),
                     Container(
                       child: Text(
                         "6月23日",
                         style: TextStyle(
                                color: Color(0xFFAAAAAA),
                                fontSize: ScreenUtil().setSp(28.0)
                              ),
                       ),
                     )
                   ],
                 ),
              subtitle: Container(
                   margin: EdgeInsets.only(top: ScreenUtil().setHeight(20.0)),
                   alignment: Alignment.centerLeft,
                   child: Text(
                            "腾讯科技•Python高级开发工程师",
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xFFAAAAAA),
                                fontSize: ScreenUtil().setSp(28.0),
                                letterSpacing: 1.0
                              ),
                          ),
                 ),
            ),
            onTap: (){
              NavigatorUtils.push(context, MsgRouter.msgDetail);
            },
            )
          ),
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: '联系',
              color: Color(0xFFC9C6CD),
              foregroundColor:Colours.text_white,
              icon: Icons.call,
              onTap: (){},
            ),
            IconSlideAction(
              caption: '删除',
              color: Color(0xFFFF3B32),
              foregroundColor:Colours.text_white,
              icon: Icons.delete,
              onTap: () => _showDeleteBottomSheet(index),
            ),
          ],
        )
    );
}

_showDeleteBottomSheet(int index){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Material(
          color: Colors.white,
          child: SafeArea(
            child: Container(
              height: 161.2,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 52.0,
                    child: Text(
                      "是否确认删除，防止错误操作",
                      style: TextStyles.textDark16,
                    ),
                  ),
                  Gaps.line,
                  Container(
                    height: 54.0,
                    width: double.infinity,
                    child: FlatButton(
                      textColor: Colours.text_red,
                      child: Text("确认删除", style: TextStyle(fontSize: Dimens.font_sp18)),
                      onPressed: (){
                        setState(() {
                          _list.removeAt(index);
                        });
                        NavigatorUtils.goBack(context);
                      },
                    ),
                  ),
                  Gaps.line,
                  Container(
                    height: 54.0,
                    width: double.infinity,
                    child: FlatButton(
                      textColor: Colours.text_gray,
                      child: Text("取消", style: TextStyle(fontSize: Dimens.font_sp18)),
                      onPressed: (){
                        NavigatorUtils.goBack(context);
                      },
                    ),
                  ),
                ],
              )
            ),
          ),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}