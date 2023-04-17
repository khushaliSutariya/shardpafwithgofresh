import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../Screens/comman/NavigationbarScreen.dart';
import '../widgets/MyPrimaryButton.dart';
import '../widgets/MyTextBox.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({Key? key}) : super(key: key);

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffFFFFFF),
                  alignment: Alignment.topCenter,
                  child: Center(
                      child: Image.asset(
                        "img/loginbackground.png",
                        color: Color(0xfffbedee),
                      )),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.0,left: 20.0,top: 20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),                            child: Center(
                                child: Image.asset(
                              "img/logo.png",
                              height: 160.0,
                              width: 160.0,
                            )),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "Reset Your Password",
                            style: TextStyle(
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.bold,
                                fontSize: 23.0),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: MyTextBox(controller: _email,validator: (value) {

                            },hintText: "Email Address"),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                          ),
                          SizedBox(
                            height: 50.0,
                            width: 150.0,
                            child: MyPrimaruButton(buttonText: 'Submit',onclick: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavigationbarScreen(),));

                            },),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "SourceSansPro",
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
