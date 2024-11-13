import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, required this.icon, required this.onSaved});
  final String hintText;
  final Icon icon  ; 
 final  void Function(String?)? onSaved ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved ,
      validator: (value){
        if(value!.isEmpty){
          return 'هذا الحقل مطلوب ';
        }
        return null ;
      },
      decoration: InputDecoration(
        hintText:hintText ,
        suffixIcon: icon ,
      ),
    );
  }
}