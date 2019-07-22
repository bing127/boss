import 'package:fluro/fluro.dart';
import 'package:boss_app/routers/router_init.dart';

import 'position_page.dart';
import 'position_add.dart';
import 'position_search.dart';
import 'position_filter.dart';
import 'position_city.dart';
import 'position_detail.dart';


class PositionRouter implements IRouterProvider{

  static String positionPage = "/position";
  static String positionAdd = "/position/add";
  static String positionSearch = "/position/search";
  static String positionFilter = "/position/filter";
  static String positionCity = "/position/city";
  static String positionDetail = "/position/detail";

  @override
  void initRouter(Router router) {
    router.define(positionPage, handler: Handler(handlerFunc: (_, params) => PositionPage()));
    router.define(positionAdd, handler: Handler(handlerFunc: (_, params) => PositionAdd()));
    router.define(positionSearch, handler: Handler(handlerFunc: (_, params) => PositionSearch()));
    router.define(positionFilter, handler: Handler(handlerFunc: (_, params) => PositionFilter()));
    router.define(positionCity, handler: Handler(handlerFunc: (_, params) => PositionCity()));
    router.define(positionDetail, handler: Handler(handlerFunc: (_, params) => PositionDetail()));
  }
  
}