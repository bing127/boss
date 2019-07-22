import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boss_app/public.dart';

/*
* 主页面
* */
import 'package:boss_app/page/position/position_page.dart';
import 'package:boss_app/page/company/company_page.dart';
import 'package:boss_app/page/msg/msg_page.dart';
import 'package:boss_app/page/my/my_page.dart';

class RootScene extends StatefulWidget {
  final Widget child;

  RootScene({Key key, this.child}) : super(key: key);
  _RootSceneState createState() => _RootSceneState();
}

class _RootSceneState extends State<RootScene> {
  int _tabIndex = 0;
  bool isLoaded = false;
  var _appBarTitles = ['职位', '公司', '消息', '我的'];
  var _pageList;
  var _tabImages ;
  DateTime  _lastTime;
  final _pageController = PageController();

  Widget _buildTabText(int curIndex) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Text(_appBarTitles[curIndex]),
    );
  }

  /*
  * icon路径
  */
  Image _getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabImages[index][1];
    } else {
      return _tabImages[index][0];
    }
  }

  /*
  * 处理tabbar图片
  */
  Image getTabImage(String path) {
    var url = "assets/images/tabbar/${path}.png";
    return new Image.asset(url, width: 24.0, height: 24.0);
  }

  void _onPageChanged(int index){
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initData() {
    /*
     * tab_icon
     */
    _tabImages  = [
      [getTabImage('ic_nav_tab_jobs_unselect'), getTabImage('ic_nav_tab_jobs_select')],
      [getTabImage('ic_nav_tab_coms_unselect'), getTabImage('ic_nav_tab_coms_select')],
      [getTabImage('ic_nav_tab_contacts_unselect'), getTabImage('ic_nav_tab_contacts_select')],
      [getTabImage('ic_nav_tab_my_unselect'), getTabImage('ic_nav_tab_my_select')]
    ];
    _pageList = [
      PositionPage(),
      CompanyPage(),
      MsgPage(),
      MyPage()
    ];
  }

  Future<bool> _isExit(){
    if (_lastTime == null || DateTime.now().difference(_lastTime) > Duration(milliseconds: 2500)) {
      _lastTime = DateTime.now();
      Toast.show("再次点击退出应用");
      return Future.value(false);
    }
    Toast.cancelToast();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _isExit,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _getTabIcon(0),
              title: _buildTabText(0),
            ),
            BottomNavigationBarItem(
              icon: _getTabIcon(1),
              title: _buildTabText(1),
            ),
            BottomNavigationBarItem(
              icon: _getTabIcon(2),
              title: _buildTabText(2),
            ),
            BottomNavigationBarItem(
              icon: _getTabIcon(3),
              title: _buildTabText(3),
            )
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _tabIndex,
          elevation: 5.0,
          iconSize: 21.0,
          selectedFontSize: 11.0,
          unselectedFontSize: 11.0,
          selectedItemColor: Color(0xff444444),
          unselectedItemColor: Color(0xff787878),
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: _pageList,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
