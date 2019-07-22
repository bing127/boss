
import 'package:fluro/fluro.dart';
import 'package:boss_app/routers/router_init.dart';

import 'my_page.dart';


class MyRouter implements IRouterProvider{

  static String myPage = "/my";
  
  @override
  void initRouter(Router router) {
    router.define(myPage, handler: Handler(handlerFunc: (_, params) => MyPage()));
  }
  
}