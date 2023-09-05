import 'package:exam2/model/mode_sd.dart';
import 'package:flutter/material.dart';
class ListViewj extends StatefulWidget {
  const ListViewj({super.key});
  @override
  State<ListViewj> createState() => _ListViewjState();
}
class _ListViewjState extends State<ListViewj> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade300,
        leading: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.grey.shade600,
        ),
        title: Text(
          'Shoping Card',
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
        centerTitle: true,
      ),
      body:ListView.builder(
        itemCount: listMode.length,
          itemBuilder: (context,index){
        final PlaceMode prodect =listMode[index];
        return  Card(
          child: Container(
            padding: const EdgeInsetsDirectional.all(4),
            margin: const EdgeInsetsDirectional.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height:90,
            width: MediaQuery.of(context).size.width/0.90,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    prodect.image,
                    width: 70,
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${prodect.price}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          prodect.text,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Flexible(
                          child: Text(
                            prodect.supText,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 125,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              prodect.qut++;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsetsDirectional.all(2),
                          padding: const EdgeInsetsDirectional.symmetric(),
                          alignment: Alignment.center,
                          width: 19,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.yellow,
                          ),
                          child: Text(
                            '${prodect.qut}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              prodect.qut--;
                            });
                          },
                          child: Icon(
                            Icons.minimize,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );



      }),
    );
  }
}
