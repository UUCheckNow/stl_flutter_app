import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stl_flutter_app/base_router/router.dart';
import 'package:stl_flutter_app/tools/colors.dart';
import 'package:stl_flutter_app/verification_code_login/custom_button.dart';

class VerificationCodePage extends StatefulWidget {
  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  TextEditingController _verifiController;
// 是否显示清除按钮
  bool showClear = false;
  // 是否显示加载动画
  bool showLoading = false;
//  点击按钮开始加载
  bool startLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifiController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _verifiController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () async {
          // 点击空白处收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // 非主轴尽量撑满
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                child: BackButton(),
                height: 90,
                width: 65,
              ),
            ),
            buildVerifitionCodeWidget(),
            buildBottomWidget(context),
          ],
        ),
      ),
    );
  }

  Padding buildBottomWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 28, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            disabledColor: ColorsUtil.hexToColor("#eff1f4"),
            onPressed: () {
              print("重新获取验证码");
            },
            child: Text(
              "重新获取验证码（57s）",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ColorsUtil.hexToColor("#661e222b")),
            ),
          ),
          MyCustomButton(
            text: "登录",
            width: 124.0,
            loading: showLoading,
            startLoading: startLoading,
            enable: showClear,
            pressed: () {
              setState(() {
                showLoading = true;
                startLoading = true;
              });
              Navigator.of(context).pushNamed(RouteNames.REGISTERSUCCESSPAGE);
            },
          )
        ],
      ),
    );
  }

  Expanded buildVerifitionCodeWidget() {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            children: [
              Text(
                "请输入短信验证码",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorsUtil.hexToColor("#1e222b"),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "验证码已发送至（+86）15860762695",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: ColorsUtil.hexToColor("#991e222b"),
                ),
              ),
              SizedBox(
                height: 39,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch, // 非主轴尽量撑满
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: _verifiController,
                        onChanged: _onChanged,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 32,
                          color: ColorsUtil.hexToColor("#1e222b"),
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "4位验证码",
                          hintStyle: TextStyle(
                            fontSize: 32,
                            color: ColorsUtil.hexToColor("#331e222b"),
                          ),
                        ),
                      ),
                    ),
                    !showClear
                        ? Container()
                        : _wrapTap(
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 0, bottom: 20),
                              child: Icon(
                                Icons.clear,
                                // size: 20,
                                color: Colors.grey,
                              ),
                            ), () {
                            setState(() {
                              _verifiController.clear();
                            });
                            _onChanged("");
                          }),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  /*给组件添加点击事件*/
  _wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: child,
    );
  }

  /*输入框_onChangeed方法实现*/
  _onChanged(String text) {
    // 根据判断输入框有没有内容来控制清除按钮的显示或隐藏
    if (text.length > 0) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
        startLoading = false;
        showLoading = false;
      });
    }
    // 及时的将text传出去
    // if (widget.onChanged != null) {
    //   widget.onChanged(text);
    // }
  }
}
