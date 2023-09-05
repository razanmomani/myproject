import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TextView extends StatelessWidget {
  final String title;
  final Color  textColor;
  final double fontSize;
  const TextView({super.key, required this.title, this.textColor=Colors.black, required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,style:TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontStyle:FontStyle.italic,
      fontSize: fontSize??15.sp,
    ),
    );


  }
}

