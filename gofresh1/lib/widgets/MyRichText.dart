
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../resources/StyleResources.dart';

class MyRichText extends StatelessWidget{
  String? text;
  String? buttontext;
  GestureTapCallback? onclick;
  MyRichText({required this.text,required this.onclick,required this.buttontext});
  @override
  Widget build(BuildContext context) {
    return  RichText(
      text: TextSpan(
          text: text,
          style: TextStyle(
              color: Colors.black,
              fontFamily: "SourceSansPro"),
          children: [
            TextSpan(
                text: buttontext,
                style: TextStyle(
                    fontSize: 15,
                    color: StyleResources.primaryColor,
                    fontFamily: "SourceSansPro ",
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap =() {
                    onclick!();
                  })
          ]),
    );
  }

}