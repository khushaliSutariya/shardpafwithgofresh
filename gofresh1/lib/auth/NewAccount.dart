import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gofresh1/auth/Loginpage.dart';
import 'package:gofresh1/resources/StyleResources.dart';
import 'package:gofresh1/widgets/MyTextBox.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/comman/NavigationbarScreen.dart';
import '../widgets/MyPasswordTextBox.dart';
import '../widgets/MyPrimaryButton.dart';
import '../widgets/MyRichText.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({Key? key}) : super(key: key);

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleResources.scaffoldbackgroundcolor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.23,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffFFFFFF),
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
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
                          child: Center(
                              child: Image.asset(
                            "img/logo.png",
                            height: 140.0,
                            width: 160.0,
                          )),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Create New Account",
                          style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.bold,
                              fontSize: 23.0),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        MyTextBox(controller: _name,validator: (fullName) {
                          if (fullName!.length <= 0) {
                            return "Please enter your full name";
                          } else {
                            bool fullnamevalid = RegExp(r'^[a-z A-Z,.\-]+$')
                                .hasMatch(fullName);
                            if (!fullnamevalid) {
                              return "Please enter your valid full name";
                            }
                          }
                          return null;
                        },
                        hintText: "Full Name"),
                        SizedBox(
                          height: 20.0,
                        ),
                        MyTextBox(controller: _phone,validator: (phone) {
                          if (phone!.length <= 0) {
                            return "Please enter your mobile number";
                          } else {
                            bool phoneValid =
                            RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                .hasMatch(phone);
                            if (!phoneValid) {
                              return "Please enter your valid mobile number";
                            }
                          }
                          return null;
                        },
                            hintText: "Phone NO"),
                        SizedBox(
                          height: 20.0,
                        ),
                        MyTextBox(controller: _email,validator: (email) {
                          if (email!.length <= 0) {
                            return "Please enter your email";
                          } else {
                            bool emailValid = RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(email);
                            if (!emailValid) {
                              return "Please enter your valid email";
                            }
                          }
                          return null;
                        },
                            hintText: "Email Adress"),

                        SizedBox(
                          height: 20.0,
                        ),
                        MyPasswordTextBox(passcontroller: _password,
                        passvalidator: (password) {
                          if (password!.length <= 0) {
                            return "Please enter  password";
                          } else {
                            bool passwordValid = RegExp(
                                r'^((?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%&*]{6,20})$') //0 to 9,A to Z,a to z, not equle to @#$%*&
                                .hasMatch(password);
                            if (!passwordValid) {
                              return "Please enter valid password";
                            }
                          }
                        },
                        passhintText: "Password"),
                        SizedBox(
                          height: 20.0,
                        ),

                        SizedBox(
                          height: 50.0,
                          width: 150.0,
                          child: MyPrimaruButton(
                            buttonText: 'Create',
                            onclick: () async {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  var nm = _name.text.toString();
                                  print("fullname" + nm);
                                  var email = _email.text.toString();
                                  var pass = _password.text.toString();
                                  var phone = _phone.text.toString();
                                  });


                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();

                                prefs.setString(
                                    "username", _name.text.toString());
                                prefs.setString(
                                    "userphone", _phone.text.toString());
                                prefs.setString(
                                    "useremail", _email.text.toString());
                                prefs.setString(
                                    "userpass", _password.text.toString());

                                // await FirebaseFirestore.instance
                                //     .collection("gofresh")
                                //     .add({
                                //   "username": nm,
                                //   "userphone": ph,
                                //   "useremail": email,
                                //   "userpass": pass
                                // }).then((value) => {
                                //           print("Data inserted")  ,
                                //           _name.text = "",
                                //           _phone.text = "",
                                //           _email.text = "",
                                //           _password.text = "",
                                //         });

                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => NavigationbarScreen(),
                                ));
                                _name.text = "";
                                _phone.text = "";
                                _email.text = "";
                                _password.text = "";
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Please fill details",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        MyRichText(text: 'Already Have an account?',buttontext: "Login",
                        onclick: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                              builder: (context) => Loginpage(),
                          ));
                        },),

                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "img/loginbackground.png",
                      color: Color(0xfffbedee),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
