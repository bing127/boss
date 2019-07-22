
import 'package:fluro/fluro.dart';
import 'package:boss_app/routers/router_init.dart';

import 'login_page.dart';


class LoginRouter implements IRouterProvider{

  static String loginPage = "/login";
  static String registerPage = "/login/register";
  static String smsLoginPage = "/login/smsLogin";
  static String resetPasswordPage = "/login/resetPassword";
  static String updatePasswordPage = "/login/updatePassword";
  
  @override
  void initRouter(Router router) {
    router.define(loginPage, handler: Handler(handlerFunc: (_, params) => LoginPage()));
  }
  
}