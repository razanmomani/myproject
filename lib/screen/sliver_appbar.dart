import 'package:flutter/material.dart';

class CustomSlevrjj extends StatefulWidget {
  const CustomSlevrjj({super.key});
  @override
  State<CustomSlevrjj> createState() => _CustomSlevrjjState();
}

class _CustomSlevrjjState extends State<CustomSlevrjj> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // automaticallyImplyLeading: false,
            actions: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ],
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.heart_broken_sharp,
                color: Colors.red,
              ),
            ),
            elevation: 2.0,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/clom.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('hbdjsnm,'),
                leading: Icon(Icons.format_align_justify),
                contentPadding: EdgeInsetsDirectional.all(20),
                autofocus: true,
              ),
              childCount: 8,
            ),
          ),
          /*SliverToBoxAdapter(
            child: Column(
              children: [
                Text('jdjjskkmkfmd'),
              ],
            ),

          ),*/
          /*  SliverFixedExtentList(
              delegate:SliverChildBuilderDelegate((context, index) => Text('hhdjnj')) ,
              itemExtent:5.2 ),*/
        ],
      ),
    );
  }
}
