import'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:rajsthan_studio/bottom_nav_bar.dart';
import 'package:rajsthan_studio/center/theme.dart';
void main(){
  
  runApp(
    Phoenix(child: 
    root()
    )
    );
}

class root extends StatefulWidget {
  

  @override
  _rootState createState() => _rootState();
}

class _rootState extends State<root> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:theme.thread_title,
      theme:ThemeData(primarySwatch:Colors.red),
      home:Home(),
      
    );
  }
}

