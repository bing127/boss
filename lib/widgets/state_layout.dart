import 'package:flutter/cupertino.dart';
import 'package:boss_app/public.dart';

class StateLayout extends StatefulWidget {
  
  const StateLayout({
    Key key,
    @required this.type,
    this.hintText
  }):super(key: key);
  
  final StateType type;
  final String hintText;
  
  @override
  _StateLayoutState createState() => _StateLayoutState();
}

class _StateLayoutState extends State<StateLayout> {
  
  String _img;
  String _hintText;
  
  @override
  Widget build(BuildContext context) {
    switch (widget.type){
      case StateType.order:
        _img = "zwdd";
        _hintText = "暂无订单";
        break;
      case StateType.goods:
        _img = "zwsp";
        _hintText = "暂无商品";
        break;
      case StateType.network:
        _img = "zwwl";
        _hintText = "无网络连接";
        break;
      case StateType.message:
        _img = "zwxx";
        _hintText = "暂无消息";
        break;
      case StateType.account:
        _img = "zwzh";
        _hintText = "马上添加提现账号吧";
        break;
      case StateType.loading:
        _img = "";
        _hintText = "";
        break;
    }
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          widget.type != StateType.loading ? Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Utils.getImgPath("state/$_img")),
              ),
            ),
          ): CupertinoActivityIndicator(radius: 18.0),
          Gaps.vGap16,
          Text(
            widget.hintText ?? _hintText,
            style: TextStyles.textGray14,
          ),
          Gaps.vGap50,
        ],
      ),
    );
  }
}

enum StateType {
  /// 订单
  order,
  /// 商品
  goods,
  /// 无网络
  network,
  /// 消息
  message,
  /// 无提现账号
  account,
  /// 加载中
  loading
}