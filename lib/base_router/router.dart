import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stl_flutter_app/verification_code_login/register_success_page.dart';
import 'package:stl_flutter_app/verification_code_login/verif_code_login_page.dart';
import 'package:stl_flutter_app/verification_code_login/verification_code_page.dart';

import '../main.dart';

class RouteNames {
  static const String MAINPAGE = '/';
  static const String VERIFICATIONCODEPAGE = '/verificationCodePage';
  static const String VERIFICATIONCODELOGINPAGE = "/verificationCodeLoginPage";
  static const String REGISTERSUCCESSPAGE = "/registerSuccessPage";
}

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.REGISTERSUCCESSPAGE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.REGISTERSUCCESSPAGE),
          builder: (context) => RegisterSuccessPage(),
        );
      case RouteNames.VERIFICATIONCODEPAGE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.VERIFICATIONCODEPAGE),
          builder: (context) => VerificationCodePage(),
        );
      case RouteNames.VERIFICATIONCODELOGINPAGE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.VERIFICATIONCODELOGINPAGE),
          builder: (context) => VerifiCodeLoginPage(),
        );
      default:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.MAINPAGE),
          builder: (context) => MyHomePage(
            title: "首页",
          ),
        );
    }
  }
}
