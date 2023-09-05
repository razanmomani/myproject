import 'package:flutter/material.dart';

class TapBar extends StatefulWidget {
  const TapBar({super.key});

  @override
  State<TapBar> createState() => _TapBarState();
}
class _TapBarState extends State<TapBar> with TickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('homeBBx'),centerTitle: true,
        bottom: TabBar(
          tabs: [
            Tab(
              child: Text('music'),
            ),
            Tab(
              child: Text('video'),
            ),
          ],
          controller: controller,
        ),
      ),
      body:TabBarView(
        controller: controller,
        children: [
          Container(
            child: Text('jkmskmkmkdmkmkmdk'),
          ),

          Container(
            child: Text('kfkdklkslpl'),
          ),
        ],
      ),
      
    );
  }
}
