import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
   TextEditingController  _controllerusername = TextEditingController();
  TextEditingController _controllerpasswrad =TextEditingController();
  bool  isclone =false;
  bool isCleked=false;
  String ?userNameEroor;
  String ?passwordEroor;
  FocusNode  _userFous=FocusNode();//المؤشر
  FocusNode _passwordFoucs=FocusNode();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              focusNode: _userFous,
            //  readOnly: false,
            //  enabled: false,
            cursorColor:Colors.red ,
            //  cursorWidth: 20,
          //    cursorHeight: 20,
           //   cursorRadius:Radius.circular(12),
              style: TextStyle(color: Colors.teal,fontSize: 20),
             // autocorrect: false,
             // textInputAction: TextInputAction.newline,
             // textInputAction: TextInputAction.go,
             // textInputAction: TextInputAction.unspecified,
             // textInputAction: TextInputAction.route,
             // keyboardType: TextInputType.text,
             // keyboardType: TextInputType.streetAddress,
             // keyboardType: TextInputType.url,
           //   keyboardType: TextInputType.phone,
            //  keyboardType: TextInputType.number,
             // keyboardType: TextInputType.visiblePassword,
              //keyboardType: TextInputType.name,
             // keyboardType: TextInputType.emailAddress,
              keyboardType: TextInputType.multiline,
              maxLength: 100,
        buildCounter: (
            BuildContext context,
            {
              required int? currentLength,
              required int? maxLength,
              required bool? isFocused,
            }
        ) {
      return Text(
      '$currentLength of $maxLength letters',
      semanticsLabel: 'razan',
      );
      } ,

              decoration: InputDecoration(
                errorText:userNameEroor ,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black,width: 20,strokeAlign: 10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:  const BorderSide(color: Colors.black,width: 5,),

                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:const BorderSide(color: Colors.black,width: 7),
                ),

              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:const BorderSide(color: Colors.red,width: 7),
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:const BorderSide(color: Colors.red,width: 7),
                ),
                label:const Text('user name',style: TextStyle(color: Colors.black),),
                prefixIcon: const Icon(Icons.account_circle),
                prefixStyle:const TextStyle(color: Colors.black),
                hintText: 'name',
                suffixIcon:const Icon(Icons.abc),
              ),
              onTap: (){
              print('razjamf');
              },
              onChanged: (c){
               print('ajd');
              },
              onSubmitted: (lkfdkl){
               print('a');
              },
              controller: _controllerusername,
            ),
            TextField(
              focusNode: _passwordFoucs,
              //  readOnly: false,
              //  enabled: false,
              cursorColor:Colors.red ,
              //  cursorWidth: 20,
              //    cursorHeight: 20,
              //   cursorRadius:Radius.circular(12),
              style:const TextStyle(color: Colors.teal,fontSize: 20),
              // autocorrect: false,
              // textInputAction: TextInputAction.newline,
              // textInputAction: TextInputAction.go,
              // textInputAction: TextInputAction.unspecified,
              // textInputAction: TextInputAction.route,
              // keyboardType: TextInputType.text,
              // keyboardType: TextInputType.streetAddress,
              // keyboardType: TextInputType.url,
              //   keyboardType: TextInputType.phone,
              //  keyboardType: TextInputType.number,
              // keyboardType: TextInputType.visiblePassword,
              //keyboardType: TextInputType.name,
              // keyboardType: TextInputType.emailAddress,
              keyboardType: TextInputType.multiline,
              maxLength: 100,
              obscureText: true,
              enabled: true,
              decoration: InputDecoration(
                errorText: passwordEroor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:const BorderSide(color: Colors.black,width: 20,strokeAlign: 10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:const BorderSide(color: Colors.black,width: 5,),

                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:const BorderSide(color: Colors.black,width: 7),
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:const BorderSide(color: Colors.red,width: 7),
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:const BorderSide(color: Colors.red,width: 7),
                ),
                label:const  Text('passward',style: TextStyle(color: Colors.black),),
                hintText: 'pass',
                prefixIcon:const Icon( Icons.password),
                suffixIcon:const Icon(Icons.remove_red_eye_sharp),

              ),
              onTap: (){
                print('razjamf');
              },
              onChanged: (c){
                print('ajd');
              },
              onSubmitted: (lkfdkl){
                print('a');
              },
              controller: _controllerpasswrad,
            ),
            TextButton(onPressed:() {
              setState(() {
                userNameEroor=null;//validation
                passwordEroor=null;

              });

              if(_controllerusername.text.isEmpty){//validation
                setState(() {
                  userNameEroor='muste be name';
                  _userFous.requestFocus();
                });
              }

              if(_controllerpasswrad.text.isEmpty){//validation
                setState(() {
                  passwordEroor='muste  not be password';
                  _passwordFoucs.requestFocus();
                });
              }

              if(_controllerpasswrad.text.length<6){//validation
                setState(() {
                  passwordEroor='the password shoret';
                  _passwordFoucs.requestFocus();
                });
              }
              print(_controllerusername.text);
              setState(() {
                isclone=true;
              });
              print(_controllerpasswrad.text);
              setState(() {
                isCleked=true;
              });
            },
                child: const Text(
                  'button',
                ),),
            if(isclone==false)
              Text(_controllerusername.text),

            if(isCleked==false)
              Text(_controllerpasswrad.text),



          ],
        ),
      ),
    );
  }
}

