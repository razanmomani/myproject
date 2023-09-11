import 'package:flutter/material.dart';

class CommunViews {
  static final CommunViews _shared = CommunViews._private();
  factory CommunViews() => _shared;
  CommunViews._private();
  AppBar getAppBar({required String title}) {
    return AppBar(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
      title:Text(title,
        style: TextStyle(
          //  backgroundColor: Colors.red,
          fontSize: 19,
        ),
      ),
      centerTitle: true,
    );
  }
  Widget createButton(
      {required String title, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
      ),
    );
  }
}
