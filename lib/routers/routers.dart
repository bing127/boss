import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:boss_app/page/common/404.dart';
import 'package:boss_app/page/common/webview_page.dart';
import 'package:boss_app/routers/router_init.dart';
import 'package:boss_app/page/position/position_page.dart';

import 'package:boss_app/page/account/login_router.dart';
import 'package:boss_app/page/position/position_router.dart';
import 'package:boss_app/page/company/company_router.dart';
import 'package:boss_app/page/msg/msg_router.dart';
import 'package:boss_app/page/my/my_router.dart';

class Routes {

  static String home = "/home";
  static String webViewPage = "/webview";

  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        debugPrint("未找到目标页");
        return WidgetNotFound();
      });

    router.define(home, handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) => PositionPage()));
    
    router.define(webViewPage, handler: Handler(handlerFunc: (_, params){
      String title = params['title']?.first;
      String url = params['url']?.first;
      return WebViewPage(title: title, url: url);
    }));
    
    _listRouter.clear();
    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(LoginRouter());
    _listRouter.add(PositionRouter());
    _listRouter.add(CompanyRouter());
    _listRouter.add(MsgRouter());
    _listRouter.add(MyRouter());
  
    /// 初始化路由
    _listRouter.forEach((routerProvider){
      routerProvider.initRouter(router);
    });
  }
}
