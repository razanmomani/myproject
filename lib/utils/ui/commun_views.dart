
import 'package:flutter/material.dart';

class CommunViews {
  static final CommunViews _shared = CommunViews._private();
  factory CommunViews() => _shared;
  CommunViews._private();
  //widget appBar
  AppBar getAppBar({required String title}) {
    return AppBar(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
      title:Text(title,
        style: TextStyle(
          //  backgroundColor: Colors.red,
          fontSize: 19,
        ),
      ),
      centerTitle: true,
    );
  }
  //widget ElevatedButton
  Widget createButton({required String title, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
      ),
    );
  }
//Text form field
  Widget createTextFormFiled({required TextEditingController controller,required FocusNode focusNode,
    required String label,
    TextInputType keyboardType=TextInputType.text,
    TextInputAction InputActione=TextInputAction.done,
    bool isObscuer=false,
    ValueChanged<String>?onSubmitted,
    String ?preffixText,
    Widget ?suffixIcon,
  }){
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText:isObscuer ,
      keyboardType: keyboardType,
      textInputAction:InputActione,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        prefixText: preffixText,
        suffixIcon:suffixIcon ,
        border: _getBorder(), enabledBorder: _getBorder(),
        disabledBorder: _getBorder(), focusedBorder: _getBorder(),
      ),
    );
  }
  // widget border in text form filed
   OutlineInputBorder _getBorder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
     borderSide: const BorderSide(
     color: Colors.black,
     ),
    );
   }

}
