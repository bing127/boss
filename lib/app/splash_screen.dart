import 'package:flutter/material.dart';
import './root_scene.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;

  void initState() { 
    super.initState();
    _controller = AnimationController(vsync:this,duration:Duration(milliseconds:800));
    _animation = Tween(begin: 0.0,end:1.0).animate(_controller);

    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context)=>RootScene()), 
          (route)=> route==null);
      }
    });
    //播放动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.asset(
        'assets/images/bg_app_splash.jpg',
        scale: 2.0,
        fit:BoxFit.cover
      ),
    );
  }
}
