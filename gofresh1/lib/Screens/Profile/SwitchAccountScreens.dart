import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../comman/NavigationbarScreen.dart';
import 'SignupScreens.dart';

class SwitchAccountScreens extends StatefulWidget {
  const SwitchAccountScreens({Key? key}) : super(key: key);

  @override
  State<SwitchAccountScreens> createState() => _SwitchAccountScreensState();
}

class _SwitchAccountScreensState extends State<SwitchAccountScreens> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _passwordVisible = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffFFFFFF),
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "img/loginbackground.png",
                  color: Color(0xfffbedee),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 80.0),
                    child: Center(
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
                    "Create New Account",
                    style: TextStyle(
                        fontFamily: "SourceSansPro",
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                      controller: _email,
                      validator: (value) {
                        if (value!.length <= 0) {
                          return "Please enter your email";
                        } else {
                          bool emailValid = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(value);
                          if (!emailValid) {
                            return "Please enter your valid email";
                          }
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xffFE7551), width: 2.0),
                        ),
                        hintText: 'Email',
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _password,
                    obscureText: _passwordVisible,
                    validator: (password) {
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffFE7551), width: 2.0),
                      ),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xffC0C0C0),
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    width: 150.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            var email = _email.text.toString();
                            print("email" + email);
                            var pass = _password.text.toString();
                            print("password" + pass);
                          });

                          _email.text = "";
                          _password.text = "";
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NavigationbarScreen(),
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFE7551),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 25.0, fontFamily: "SourceSansPro"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xffFFFFFF),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset("img/facebook.png")),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.13,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Don't Have an account?",
                        style: TextStyle(
                            color: Colors.black, fontFamily: "SourceSansPro"),
                        children: [
                          TextSpan(
                              text: "Sign up",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffFE7551),
                                  fontFamily: "SourceSansPro ",
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignupScreens(),
                                  ));
                                })
                        ]),
                  ),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
