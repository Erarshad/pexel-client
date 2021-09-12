import 'dart:convert';

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rajsthan_studio/screen/image_lawn.dart';
import 'package:rajsthan_studio/screen/video_lawn.dart';
import 'package:rajsthan_studio/center/theme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  List<Widget> _tabList = [
    images(),
    videos()
   
  ];

  TabController ?_tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
   
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

 

  @override
  Widget build(BuildContext context) {
   
      return Scaffold(
      
        //it is the main tab controller
        body: 
        TabBarView(
         physics: NeverScrollableScrollPhysics(),
      
          controller: _tabController,
          children: _tabList,
        ),
//-------------------------------------------
//our bottom navigation start from here

        bottomNavigationBar: BottomNavigationBar(
          elevation: 20.0,

          //-----
          currentIndex: _currentIndex,
          onTap: (currentIndex) {
            setState(() {
              _currentIndex = currentIndex;
            });

            _tabController?.animateTo(_currentIndex);
          },
          unselectedItemColor: Colors.grey,

          selectedItemColor: theme.base,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.image),title: Text("Images")),
            BottomNavigationBarItem(icon: Icon(Icons.movie),title: Text("Videos"))

           
          ],
        ),
        //---
      );
    
  }
}
