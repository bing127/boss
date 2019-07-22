
import 'package:fluro/fluro.dart';
import 'package:boss_app/routers/router_init.dart';

import 'company_page.dart';
import 'company_detail.dart';


class CompanyRouter implements IRouterProvider{

  static String companyPage = "/company";
  static String companyDetail = "/company/detail";
  
  @override
  void initRouter(Router router) {
    router.define(companyPage, handler: Handler(handlerFunc: (_, params) => CompanyPage()));
    router.define(companyDetail, handler: Handler(handlerFunc: (_, params) => CompanyDetail()));
  }
  
}