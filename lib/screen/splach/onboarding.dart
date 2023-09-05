import 'package:exam2/model/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class UtilsScreen extends StatefulWidget {
  UtilsScreen({super.key});
  @override
  State<UtilsScreen> createState() => _UtilsScreenState();
}

class _UtilsScreenState extends State<UtilsScreen> {
  Container dotIndicator(index){
    return Container(
      height: 10,
      width: 20,
      decoration: BoxDecoration(
        color: currentPage==index?Colors.indigoAccent:Colors.grey,
        shape: BoxShape.circle,
      ),

    );
  }
  PageController nextPage = PageController(initialPage: 0);
  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: nextPage,
          onPageChanged: (value){
          setState(() {
            currentPage=value;
          });
          },
          itemCount: items.length,
          itemBuilder: (context, index) {
            final UtilModel model = items[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  model.image,
                ),
                Text(
                  model.title,
                  style: GoogleFonts.alike(
                    color: Colors.blueAccent,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  model.description,
                  style: GoogleFonts.alike(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                 children:List.generate(items.length, (index) =>
                     dotIndicator(index)),




                 ),



              ],
            );
          }),
    );
  }
}
