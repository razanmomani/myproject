import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';

class AutoeComplate extends StatefulWidget {
  const AutoeComplate({super.key});

  @override
  State<AutoeComplate> createState() => _AutoeComplateState();
}

//_AutoeComplate أهي موجوده ب الاندرويداستديو
//custom_searchable_dropdown هي موجود ع موقع فلاتر pub.dev
class _AutoeComplateState extends State<AutoeComplate> {
  static const List<String> _obtions = [
    'razan',
    'doaa',
    'rana',
    'Hala',
    'leen',
    'meraa',
  ];
  String _selectedOption = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: CustomSearchableDropDown(
                  items: _obtions,
                  label: 'Selcet',
                  menuMode: true,// بتوخد حسب حجم المينو از كانت ترو
                  menuHeight:200 ,
                  hideSearch: true,//از كانت ترو بختار فقط دون كتابه
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.grey,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Icon(Icons.search),
                  ),
                  dropDownMenuItems: _obtions.map((iteam){
                    return iteam;
                  }).toList()??[],
              onChanged: (value){
                    setState(() {
                      _selectedOption=value;
                    });
                        },
                  multiSelect: true,

                ),
              ),
              ElevatedButton(onPressed:(){
                showDialog(context: context,
                    builder: (BuildContext context){
                  return AlertDialog(
                    title:Text('welcome to app'),
                    content: Text('Are you suer you wont to logn'),
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    surfaceTintColor: Colors.blue,
                    scrollable: false,
                    elevation: 2,
                    backgroundColor: Colors.blue,
                    actions: [
                      TextButton(onPressed:(){
                        print('jjn');
                      }, child:Text('ok',style: TextStyle(
                        color: Colors.white,
                      ),)),
                      TextButton(onPressed:(){}, child:Text('commean',style: TextStyle(
                        color: Colors.white,
                      ),)),
                    ],

                  );

                    });

              },
                  child: Text('Show Dialog')),


              ElevatedButton(onPressed:(){
                //showAdaptiveActionSheet موجود pub.dev لIos
                showModalBottomSheet(context: context, builder:(BuildContext context){
                  return Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text('video'),
                          leading: Icon(Icons.video_call),
                          onTap: (){},

                        ),
                        ListTile(
                          title: Text('music'),
                          leading: Icon(Icons.music_note_outlined),
                        ),





                      ],




                    ),




                  );




                });



              }, child: Text(
                'Show Dialog',
              )),








                ],



              ),),



      ),
    );
  }
}
