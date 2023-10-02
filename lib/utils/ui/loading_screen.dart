import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingScreen{
static LoadingScreen shard=LoadingScreen();
BuildContext ?context;
Widget createWithLoadingScreen({Color?color,double size=50}){
  return Stack(
    children:[
      getCiricleIndecater(color:color,size:size),
    ],
  );
}
Widget getCiricleIndecater({Color?color,double size=50}){
  return Center(
    child: SpinKitFadingCircle(color: color??Colors.blue,size: 50,),
  );
}
void startLoading(BuildContext?context){
  if(context==null){
    return;
  }
  LoadingScreen.shard.context=context;
  showDialog(context: context,
      builder: (context){
    return createWithLoadingScreen();
      },barrierDismissible: false,
  );
}
void stopLoading(){
if(LoadingScreen.shard.context!=null&&
    Navigator.of(LoadingScreen.shard.context!).canPop())
  {
    Navigator.of(LoadingScreen.shard.context!).pop();
  }
LoadingScreen.shard.context=null;
 }
}
/*
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen {
  static LoadingScreen shred = LoadingScreen();
  BuildContext? context;

  Widget createLoadingWithScreen({Color? color, double size = 50}) {
    return Stack(
      children: [
        getCiricleIndectear(color: color, size: size),
      ],
    );
  }
  Widget getCiricleIndectear({Color? color, double size = 50}) {
    return Center(
      child: SpinKitFadingCircle(
        color: color ?? Colors.blue,
        size: 50,
      ),
    );
  }
  void startLoading(BuildContext? context) {
    if (context == null) {
      return;
    }
    LoadingScreen.shred.context = context;

    showDialog(
        context: context,
        builder: (context) {
          return createLoadingWithScreen();
        },
        barrierDismissible: false);
  }

  void stopLoading() {
    if (LoadingScreen.shred.context != null &&
        Navigator.of(LoadingScreen.shred.context!).canPop()) {
      Navigator.of(LoadingScreen.shred.context!, rootNavigator: true).pop();
      LoadingScreen.shred.context = null;
    }
  }
}
*/
