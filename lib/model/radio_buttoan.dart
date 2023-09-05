import 'package:exam2/model/radiobuttoan/radoa_buttoan.dart';
import 'package:flutter/material.dart';

class RadioOptionsWidget extends StatefulWidget {
  const RadioOptionsWidget({super.key});
  @override
  State<RadioOptionsWidget> createState() => _RadioOptionsWidgetState();
}

class _RadioOptionsWidgetState extends State<RadioOptionsWidget> {
  int selectedOption = 0;
  void ValueChange(int value) {
    setState(() {
      selectedOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: listRadio.length,
          itemBuilder: (context, index) {
            final RadioaModel model = listRadio[index];
            return Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(5),
                      color: model.color,
                    ),
                    child: RadioListTile(
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value as int;
                        });
                      },
                      activeColor: Colors.red,
                      value: index,
                      groupValue: selectedOption,
                      selectedTileColor: Colors.grey,
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: Text(
                        model.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
