import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stl_flutter_app/base_router/router.dart';
import 'package:stl_flutter_app/tools/colors.dart';
import 'custom_button.dart';
import 'image_button.dart';

class VerifiCodeLoginPage extends StatefulWidget {
  @override
  _VerifiCodeLoginPageState createState() => _VerifiCodeLoginPageState();
}

class _VerifiCodeLoginPageState extends State<VerifiCodeLoginPage> {
  TextEditingController _userController;
// 是否显示清除按钮
  bool showClear = false;
// 是否显示加载动画
  bool showLoading = false;
//  点击按钮开始加载
  bool startLoading = false;

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 11, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // 非主轴尽量撑满
            children: [
              Expanded(flex: 1, child: buildPhoneNumWidget()),
              buildBottomButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Row buildBottomButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SimpleImageButton(
          normalImage: "assets/images/icon_login_wechat_64_def.png",
          pressedImage: "assets/images/icon_login_wechat_64_def.png",
          onPressed: () {
            print("object");
          },
          width: 36,
        ),
        SimpleImageButton(
          normalImage: "assets/images/icon_login_qq_88_def.png",
          pressedImage: "assets/images/icon_login_qq_88_def.png",
          onPressed: () {
            print("object");
          },
          width: 36,
        ),
        SimpleImageButton(
          normalImage: "assets/images/icon_login_weibo_88_def.png",
          pressedImage: "assets/images/icon_login_weibo_88_def.png",
          onPressed: () {
            print("object");
            setState(() {
              showLoading = false;
              startLoading = false;
            });
          },
          width: 36,
        ),
        MyCustomButton(
          enable: showClear,
          width: 165.0,
          text: "获取验证码",
          loading: showLoading,
          startLoading: startLoading,
          pressed: () {
            setState(() {
              showLoading = true;
              startLoading = true;
            });
            Navigator.of(context).pushNamed(RouteNames.VERIFICATIONCODEPAGE);
          },
        ),
      ],
    );
  }

  ListView buildPhoneNumWidget() {
    return ListView(
      children: [
        SizedBox(
          width: 60,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "密码登录",
              style: TextStyle(
                fontSize: 16,
                color: ColorsUtil.hexToColor("#991e222b"),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 42,
        ),
        Text(
          "手机登录/注册",
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
          "登录即表示同意 用户协议 和 隐私政策，未注册手机号验证后自动注册。",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: ColorsUtil.hexToColor("#991e222b"),
          ),
        ),
        SizedBox(
          height: 28,
        ),
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch, // 非主轴尽量撑满
            children: [
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 16.0, top: 5, bottom: 5),
                  child: Text(
                    "+86>",
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorsUtil.hexToColor("#333333"),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: _userController,
                  onChanged: _onChanged,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 32,
                    color: ColorsUtil.hexToColor("#1e222b"),
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "请输入手机号",
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
                        _userController.clear();
                      });
                      _onChanged("");
                    }),
            ],
          ),
        )
      ],
    );
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
