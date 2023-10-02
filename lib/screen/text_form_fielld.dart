import 'package:flutter/material.dart';

class TextForFielld extends StatefulWidget {
  const TextForFielld({super.key});

  @override
  State<TextForFielld> createState() => _TextForFielldState();
}
class _TextForFielldState extends State<TextForFielld> {
  TextEditingController _controller=TextEditingController();
  TextEditingController _controllerpasswrd=TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: _bulidOutlinInbutBorder(),
                    enabledBorder: _bulidOutlinInbutBorder(),
                    focusedBorder: _bulidOutlinInbutBorder(),
                    disabledBorder: _bulidOutlinInbutBorder(),
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                  style: TextStyle(color: Colors.red,fontSize: 18),
                  validator: (String?value){
                    if(value==null||value.isEmpty){
                      return 'requeerd user name';
                    }
                    if(!value.contains('@'))
                   return 'the name is at';
                    return null;
                  },
              //    autovalidateMode: AutovalidateMode.always,



                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _controllerpasswrd,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: _bulidOutlinInbutBorder(),
                    enabledBorder: _bulidOutlinInbutBorder(),
                    focusedBorder: _bulidOutlinInbutBorder(),
                    disabledBorder: _bulidOutlinInbutBorder(),
                    label: Text('password'),
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                  style: TextStyle(color: Colors.red,fontSize: 18),

                  validator: (String ?value){
                    if(value==null||value.isEmpty){
                      return 'requeared passwoard edit';
                    }
                    return null;
                  },
             //     autovalidateMode: AutovalidateMode.always,

                ),

                ElevatedButton(
                  onPressed: () {
                    if(_key.currentState!.validate()){
                      print('the sucssed');
                    }
                  },
                  child:const Text(
                    'Submet',

                ),),


              ],
            ),
          ),
        ),
      ),
    );
  }
  OutlineInputBorder  _bulidOutlinInbutBorder(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide:const BorderSide(color: Colors.black,width: 7),
    );
  }




}
