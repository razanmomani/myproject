import 'package:exam2/screen/exam_list.dart';
import 'package:exam2/screen/my_home.dart';
import 'package:exam2/screen/sliver_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersistentBottomNavBarItem{
  Widget ?icon;
  String title;
  Widget view;
  PersistentBottomNavBarItem({
    this.icon,
   required this.title,
     required this.view,
});
}
List<PersistentBottomNavBarItem>bootomModel=[
  PersistentBottomNavBarItem(

      title: 'Home',
    view: Container(),
  ),
  PersistentBottomNavBarItem(
      title: 'person',
    view: Container(),

  ),

  PersistentBottomNavBarItem(
      title: 'settings',
    view: Container(),


  ),






];