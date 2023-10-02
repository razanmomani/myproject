import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class ListViewd extends StatefulWidget {
  const ListViewd({super.key});
  @override
  State<ListViewd> createState() => _ListViewdState();
}
class _ListViewdState extends State<ListViewd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:const Icon(Icons.arrow_forward),
        title:const Text('Barking'),
      ),
      body: Container(
        color: Colors.green,
        child: ListView(
         // shrinkWrap: false,
          scrollDirection: Axis.vertical,
         // itemExtent: 90,
        //  reverse: true,
        // primary:false ,
          padding:const EdgeInsetsDirectional.all(20),
          physics: const ClampingScrollPhysics(),
          prototypeItem: const Text('dfjnjn'),
          dragStartBehavior:DragStartBehavior.start ,
      /*    addAutomaticKeepAlives: true,
          addRepaintBoundaries: true,
          addSemanticIndexes: true,*/
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          cacheExtent: 50.0,
          clipBehavior:Clip.antiAliasWithSaveLayer,
          restorationId: 'djijd',




          children:const [
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),
            Text('c++'),

          ],

        ),
      ),

    );
  }
}
