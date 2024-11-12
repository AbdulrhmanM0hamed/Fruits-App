import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, required this.icon});
  final String hintText;
  final Icon icon  ; 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText:hintText ,
        suffixIcon: icon ,
      ),
    );
  }
}