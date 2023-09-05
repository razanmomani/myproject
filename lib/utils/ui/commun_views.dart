import 'package:flutter/material.dart';

class CommunViews {
  static final CommunViews _shared=CommunViews._private();
  factory CommunViews()=>_shared;
  CommunViews._private();
  AppBar getAppBar(){
    return AppBar(
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom:Radius.circular(50))),
    title: Text('Shopping Card',
      style: TextStyle(
      //  backgroundColor: Colors.red,
        fontSize: 19,
      ),
      ),
      centerTitle: true,
    );

  }
}