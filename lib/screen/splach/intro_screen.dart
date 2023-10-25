import 'package:exam2/model/onboarding.dart';
import 'package:exam2/screen/login/login_screen.dart';
import 'package:exam2/utils/ui/commun_views.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../config/cashe_key.dart';
import '../../utils/helpers/navigte.dart';
import '../../utils/helpers/shared_preferences_helper.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}
class _IntroScreenState extends State<IntroScreen> {
  Container dotIndicator(index) {
    return Container(
      height: 10,
      width: 20,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.indigoAccent : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
  PageController nextPage = PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: nextPage,
          onPageChanged: (currentPage) {
            setState(() {
              _currentPage = currentPage;
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
                SmoothPageIndicator(
                    controller: nextPage, // PageController
                    count: items.length,
                    effect: WormEffect(), // your preferred effect
                    onDotClicked: (index) {}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CommunViews().createButton(
                        title: 'Back',
                        onPressed: () {
                          nextPage.animateToPage(_currentPage - 1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linear);
                        }),
                    _currentPage == items.length - 1
                        ? CommunViews().createButton(
                            title: 'Done',
                            onPressed: () {
                              saveData();
                              Fip5Navigator.of(context)
                                  .pushAndRemoveUntil(LoginScreen());
                            })
                        : CommunViews().createButton(
                            title: 'Next',
                            onPressed: () {
                              nextPage.animateToPage(_currentPage + 1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.linear);
                            }),
                  ],
                ),
              ],
            );
          }),
    );
  }
}

void saveData()async{
  SharedPreferencesHelper().save(key: CasheKeys.introKey, value: true, type: SaveType.boolType);
}
