import 'package:flutter/material.dart';
import 'package:wan_android_flutter/page_home.dart';
import 'package:wan_android_flutter/page_mine.dart';
import 'package:wan_android_flutter/page_system.dart';

void main()=>runApp(WanAndroidApp());

class WanAndroidApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WanAndroid",
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>MainPageState();
}

class MainPageState extends State {

  int _select=0;
  static  final List<Widget> _widget=<Widget>[
    HomePage(),
    SystemPage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widget.elementAt(_select),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Image.asset('images/tab_home_normal.webp',height: 30,),label: "首页"),
          BottomNavigationBarItem(icon: Image.asset('images/tab_activity.webp',height: 30),label: "体系"),
          BottomNavigationBarItem(icon: Image.asset('images/tab_profile_normal.webp',height: 30),label: "我"),
        ],
        currentIndex: _select,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        onTap:_onItemTapped ,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _select=index;
    });
  }
}