import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:gofresh1/Screens/comman/Homepage.dart';
import 'package:gofresh1/auth/NewAccount.dart';
import 'package:gofresh1/auth/Resetpassword.dart';
import 'package:gofresh1/resources/StyleResources.dart';
import 'package:gofresh1/widgets/MyPasswordTextBox.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Screens/comman/NavigationbarScreen.dart';
import '../widgets/MyPrimaryButton.dart';
import '../widgets/MyRichText.dart';
import '../widgets/MyTextBox.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _passwordVisible = true;
  final _formkey = GlobalKey<FormState>();
  Map<String, dynamic>? userdata;
  AccessToken? _assesToken;
  bool _changlog = true;
  var email = "";
  var password = "";


  getlogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString("useremail")!;
    password = prefs.getString("userpass")!;
  }

  @override
  initState() {
    getlogin();
  }

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      _assesToken = result.accessToken;
      var userdata = await FacebookAuth.instance.getUserData();
      userdata = userdata;
      print("====================================$userdata");

      AuthCredential authCredential =
          FacebookAuthProvider.credential(result.accessToken?.token ?? '');

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(authCredential);
    } else {
      print(result.status);
      print("=================result");
      print(result.message);
      print("============================message");
    }
    setState(() {
      _changlog = false;
    });
  }

  _logout() async {
    await FacebookAuth.instance.logOut();
    _assesToken = null;
    userdata = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Form(
        key: _formkey,
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
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
                    child: Column(
                      children: [
                        // Text("email" + email),
                        // Text("password" + password),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.1),
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
                          "Login",
                          style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.bold,
                              fontSize: 23.0),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        MyTextBox(
                          controller: _email,
                          validator: (email) {
                            if (email!.length <= 0) {
                              return "Please enter your email";
                            } else {
                              bool emailValid = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(email);
                              if (!emailValid) {
                                return "Please enter your valid email";
                              }
                              return null;
                            }
                          },
                          hintText: 'Enter Email',
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        MyPasswordTextBox(
                            passcontroller: _password,
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
                          height: 5.0,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Resetpassword(),
                              ));
                            },
                            child: Text(
                              "Forget Password?",
                              style: TextStyle(
                                  color: StyleResources.primaryColor,
                                  fontFamily: "SourceSansPro"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: 50.0,
                          width: 150.0,
                          child: MyPrimaruButton(
                            buttonText: 'Login',
                            onclick: () async {
                              FocusScope.of(context).unfocus();
                              if (_formkey.currentState!.validate()) {
                                setState(() {
                                  var name = _email.text.toString();
                                  print("name" + name);
                                  var password = _password.text.toString();
                                  print("password" + password);
                                });

                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                var useremail =
                                    prefs.getString("useremail") ?? "";
                                var userpass = prefs.getString("userpass") ?? "";
                                if (_email.text.toString() == useremail &&
                                    _password.text.toString() == userpass) {

                                  prefs.setBool("login", true);

                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NavigationbarScreen(),
                                  ));
                                } else {
                                  print("error========");
                                }
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Or Continue With",
                          style: TextStyle(
                            fontSize: 15,
                            color: StyleResources.primaryColor,
                            fontFamily: "SourceSansPro ",
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xffFFFFFF),
                              ),
                              child: IconButton(
                                  onPressed: () async {
                                    await _login();
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          NavigationbarScreen(),
                                    ));
                                  },
                                  icon: Image.asset("img/facebook.png")),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.13,
                            ),
                            Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xffFFFFFF),
                              ),
                              child: IconButton(
                                  onPressed: () async {
                                    GoogleSignIn googleSignIn = GoogleSignIn();
                                    final GoogleSignInAccount?
                                        googleSignInAccount =
                                        await googleSignIn.signIn();
                                    if (googleSignInAccount != null) {
                                      final GoogleSignInAuthentication
                                          googleSignInAuthentication =
                                          await googleSignInAccount
                                              .authentication;
                                      final AuthCredential authCredential =
                                          GoogleAuthProvider.credential(
                                              idToken:
                                                  googleSignInAuthentication
                                                      .idToken,
                                              accessToken:
                                                  googleSignInAuthentication
                                                      .accessToken);
                                      UserCredential result = await auth
                                          .signInWithCredential(authCredential);
                                      User? user = result.user;
                                      var name = user!.displayName.toString();
                                      var email = user!.email.toString();
                                      var photo = user!.photoURL.toString();
                                      var googleid = user!.uid.toString();
                                      print(name);
                                      print(email);
                                      print(photo);
                                      print(googleid);
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            NavigationbarScreen(),
                                      ));
                                    }
                                  },
                                  icon: Image.asset("img/google.png")),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        MyRichText(
                          text: "Don't Have an account?",
                          buttontext: "Create",
                          onclick: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NewAccount(),
                            ));
                          },
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
