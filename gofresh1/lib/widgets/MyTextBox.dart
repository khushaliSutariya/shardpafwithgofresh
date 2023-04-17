
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget{
  TextEditingController? controller;
  FormFieldValidator validator;
  String hintText;
  MyTextBox({required this.controller,required this.validator,required this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffFFFFFF),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          focusedBorder:  OutlineInputBorder(
            borderSide:  BorderSide(
                color: Color(0xffFE7551), width: 2.0),
          ),
          enabledBorder: InputBorder.none,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)),
          hintText:hintText,
        ),    ),
    );
  }


}

