import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';

class Project extends StatefulWidget {
  const Project({super.key});
  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  List<String> titeol = [
    'razan',
    'omar',
    'rana',
    'sara',
    'majd',
    'hani',
    'doaa',
    'aws',
    'yazan',
  ];
  int? num;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            CustomSearchableDropDown(
                //   enabled: false,
                //  searchBarHeight: 15,
                // showClearButton: false,
                //showLabelInMenu: true,
                suffixIcon: Icon(
                  Icons.search,
                ),
                //  dropdownHintText: 'rafn',
                /*  dropdownItemStyle: TextStyle(
                    fontSize: 27,
                  ),*/
                //   dropdownBackgroundColor: Colors.orange,
                //   hideSearch: false,
                //  hint: 'hjdn',
                // labelAlign: TextAlign.center,
                //    multiSelect: true,
                // multiSelectTag: 'jj',
                //  menuHeight: 120.0,
                menuMode: true,
                menuPadding: EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                items: titeol,
                label: 'Employes',
                onChanged: (value) {
                 setState(() {
                   num = value;
                 });
                },
                dropDownMenuItems: titeol.map((iteam) {
                      return iteam;
                    }).toList() ??
                    []),
            ElevatedButton(
              onPressed: () {
                //  Navigator.of(context).pop();
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Alerto Dialog '),
                        content: Text('How the AlertDialog in Box main'),
                        actions: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Supmate',
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Ok',
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Text(
                'Button',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadiusDirectional.circular(20),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.music_note_outlined,
                                  color: Colors.red,
                                ),
                                title: Text('Music'),
                                textColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(20),
                                ),
                                // dense: false,
                                // contentPadding: EdgeInsetsDirectional.all(8),
                                onTap: () {},
                                //  titleAlignment: ListTileTitleAlignment.center,
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.video_collection_outlined,
                                ),
                                title: Text('Video'),
                                onTap: () {},
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Text('Options')),
          ],
        ),
      ),
    );
  }
}
