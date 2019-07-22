
import 'package:fluro/fluro.dart';
import 'package:boss_app/routers/router_init.dart';

import 'msg_page.dart';
import 'msg_detail.dart';


class MsgRouter implements IRouterProvider{

  static String msgPage = "/msg";
  static String msgDetail = "/msg/detail";
  
  @override
  void initRouter(Router router) {
    router.define(msgPage, handler: Handler(handlerFunc: (_, params) => MsgPage()));
    router.define(msgDetail, handler: Handler(handlerFunc: (_, params) => MsgDetail()));
  }
  
}