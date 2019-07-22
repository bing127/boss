import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:boss_app/public.dart';
import 'package:flutter/widgets.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class MsgDetail extends StatefulWidget {
  MsgDetail({Key key}) : super(key: key);

  _MsgDetailState createState() => _MsgDetailState();
}

class _MsgDetailState extends State<MsgDetail> with SingleTickerProviderStateMixin {
  ScrollController _controller = ScrollController();
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = new Tween(begin: 0.0, end: 100.0).animate(controller)
      ..addListener(() {
        setState(() {
           _controller.jumpTo(_controller.position.maxScrollExtent);
        });
      });
    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Container(
            width: ScreenUtil().setWidth(250),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    "张三儿",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(32.0)
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(10.0)),
                  child: Text(
                    "腾讯科技•HR经理",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(22.0)
                    ),
                  ),
                ),
              ],
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
                "icon/ic_chat_more",
                width: ScreenUtil().setWidth(40.0),
                height: ScreenUtil().setWidth(40.0),
              ),
            ),
          ],
        ),
        body: Stack(
            children: <Widget>[
              SingleChildScrollView(
                controller: _controller,
                child:ListBody(
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil().setHeight(120),
                    ),
                    _chatSend("BOSS好，我正在找Web前端开发工程师的工作。目前工作4年，积累了node.js、vue.js、css3等方面的技能。详情可查看我的微简历，静候您的回复。","avatar.jpg"),
                    _chatReceive("你好","avatar.jpg"),
                    _chatReceive("我想要一份您的附件简历到我的邮箱，您是否同意","avatar.jpg"),
                    _chatSend("可以，稍等","avatar.jpg"),
                    _chatSend("贵公司福利待遇怎么样？","avatar.jpg"),
                    _chatSend("有五险一金么","avatar.jpg"),
                    _chatReceive("有的","avatar.jpg"),
                    SizedBox(
                      height:ScreenUtil().setHeight(110) ,
                    )
                  ],
                )
              ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  height: ScreenUtil().setHeight(100),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(ScreenUtil().setWidth(20.0)),
                    child: FormKeyboardActions(
                      child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10.0)),
                          child: Container(
                            height: ScreenUtil().setHeight(60),
                            width: ScreenUtil().setWidth(130),
                            color: Colours.app_main,
                            alignment: Alignment.center,
                            child: Text(
                                "常用语"
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: TextField(
                              autofocus: true,
                              maxLines: 1,
                              cursorColor:Colours.app_main,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:"说点什么...",
                                contentPadding: const EdgeInsets.only(top: 0.0, left: 8.0, right: -16.0),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            loadAssetImage(
                              "icon/ic_evaluation_satisfied_gray",
                              width: ScreenUtil().setWidth(70.0)
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(10.0),
                            ),
                            loadAssetImage(
                                "icon/ic_gallery_add",
                                width: ScreenUtil().setWidth(70.0)
                            ),
                          ],
                        ),
                      ]
                      )
                    )
                  ),
                ),
                Positioned(
                       top: 0,
                       left: 0,
                       right: 0,
                       height: ScreenUtil().setHeight(120),
                       child: Container(
                         color: Colours.text_white,
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                             _menuItem('icon/ic_phone','换电话'),
                             _menuItem('icon/ic_wechat_display','换微信'),
                             _menuItem('icon/ic_resume_send','发简历'),
                             _menuItem('icon/ic_reject_disable','不感兴趣'),
                           ],
                         ),
                       )
                     ),
            ]
        )
    );
  }

 Widget _chatReceive(title,img){
   return Container(
     margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20.0)),
     padding: EdgeInsets.only(right: ScreenUtil().setWidth(120),top: ScreenUtil().setHeight(20.0),bottom: ScreenUtil().setHeight(20.0),left: ScreenUtil().setHeight(20.0),),
     child: Container(
       child: Row(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.end,
       children: <Widget>[
         CircleAvatar(
           backgroundImage: AssetImage("assets/images/$img"),
           radius: ScreenUtil().setWidth(50.0),
         ),

         ConstrainedBox(
           constraints: BoxConstraints(
             maxWidth: ScreenUtil().setWidth(460),
             minWidth: ScreenUtil().setWidth(230)
           ),
           child: Container(
             padding: EdgeInsets.all(ScreenUtil().setWidth(20.0)),
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(20.0)),
              decoration: BoxDecoration(
                color: Colours.text_white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ScreenUtil().setWidth(10.0)),
                  topRight: Radius.circular(ScreenUtil().setWidth(10.0)),
                  bottomLeft: Radius.circular(ScreenUtil().setWidth(10.0))
                )
           ),
           child: Text(
             "$title",
              style: TextStyle(
                color: Colors.black,
                height: ScreenUtil().setHeight(2.35)
              ),
           ),
           ),
         ),
       ],
     ),
     )
   );
 }

 Widget _menuItem(icon,title){
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(750)/4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          loadAssetImage(
              "$icon",
              width: ScreenUtil().setWidth(60.0)
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(10.0)),
            child: Text(
              "$title",
              style: TextStyle(
                  color: Color(0xFF646464)
              ),
            ),
          )
        ],
      ),
    );
 }
 Widget _chatSend(title,img){
   return Container(
     margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20.0)),
     padding: EdgeInsets.only(left: ScreenUtil().setWidth(120),top: ScreenUtil().setHeight(20.0),bottom: ScreenUtil().setHeight(20.0),right: ScreenUtil().setHeight(20.0),),
     child: Container(
       child: Row(
       mainAxisAlignment: MainAxisAlignment.end,
       crossAxisAlignment: CrossAxisAlignment.end,
       children: <Widget>[
         ConstrainedBox(
           constraints: BoxConstraints(
             maxWidth: ScreenUtil().setWidth(460),
             minWidth: ScreenUtil().setWidth(230)
           ),
           child: Container(
             padding: EdgeInsets.all(ScreenUtil().setWidth(20.0)),
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(20.0)),
              decoration: BoxDecoration(
                color: Colours.app_main,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ScreenUtil().setWidth(10.0)),
                  topRight: Radius.circular(ScreenUtil().setWidth(10.0)),
                  bottomLeft: Radius.circular(ScreenUtil().setWidth(10.0))
                )
           ),
           child: Text(
             "$title",
              style: TextStyle(
                height: ScreenUtil().setHeight(2.35)
              ),
           ),
           ),
         ),
         CircleAvatar(
           backgroundImage: AssetImage("assets/images/$img"),
           radius: ScreenUtil().setWidth(50.0),
         )
       ],
     ),
     )
   );
 }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;



}