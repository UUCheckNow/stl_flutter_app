import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stl_flutter_app/tools/colors.dart';

class RegisterSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 61, 25, 0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              child: Image(
                  image: AssetImage("assets/images/icon_succeed_240_def.png")),
            ),
            SizedBox(
              height: 19,
            ),
            Text(
              "恭喜您，注册成功！",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: ColorsUtil.hexToColor("#1e222b")),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "现在您可进入汇聊至【金币商城】消费，新用户享受首单免运费，限使用金币支付哦～",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, color: ColorsUtil.hexToColor("#1e222b")),
            ),
            SizedBox(
              height: 48,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 327,
                  height: 169,
                  child: Image(
                      image: AssetImage(
                          "assets/images/bg_account_number_def.png")),
                ),
                Positioned(
                    top: 24,
                    child: Text("获取您的专属汇聊号",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white))),
                Text("72345",
                    style: TextStyle(fontSize: 44, color: Colors.white)),
                Positioned(
                    bottom: 14,
                    child: Text("汇聊内部用于登录账号/添加加好友，更方便快捷！",
                        style: TextStyle(fontSize: 12, color: Colors.white))),
              ],
            ),
            SizedBox(
              height: 78,
            ),
            Container(
              width: 56,
              height: 56,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(28))),
                  onPressed: () {},
                  color: Colors.blue,
                  child: Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
