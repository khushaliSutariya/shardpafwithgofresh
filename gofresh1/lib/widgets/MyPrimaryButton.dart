import 'package:flutter/material.dart';
import 'package:gofresh1/resources/StyleResources.dart';
class MyPrimaruButton extends StatelessWidget{
  String buttonText = "";
  VoidCallback onclick;
  MyPrimaruButton({required this.buttonText,required this.onclick});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onclick,
      style: ElevatedButton.styleFrom(
        backgroundColor: StyleResources.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),

      child: Text(buttonText,style: TextStyle(fontSize: 20.0),),
    );
  }

}



