import 'package:exam2/model/grid_view_.dart';
import 'package:flutter/material.dart';
class GridViewScreen extends StatefulWidget {
   const GridViewScreen({super.key});
  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}
class _GridViewScreenState extends State<GridViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
        title:  Text('GridView',style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
    body:GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: lapellist.length,
        itemBuilder: (context,index){
          final GridModel prodect =lapellist[index];
          return Card(
            color:prodect.colors,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: prodect.colors,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(prodect.text),
                  Text(prodect.supText),
                  Text(prodect.title),
                ],
              ),
            ),
          );

        }),





    );
    }
}


