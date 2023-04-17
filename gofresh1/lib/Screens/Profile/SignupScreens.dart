import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../comman/NavigationbarScreen.dart';
import 'SwitchAccountScreens.dart';
class SignupScreens extends StatefulWidget {
  const SignupScreens({Key? key}) : super(key: key);

  @override
  State<SignupScreens> createState() => _SignupScreensState();
}

class _SignupScreensState extends State<SignupScreens> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "GoFresh",
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
                      child: TextFormField(
                          controller: _username,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffFE7551), width: 2.0),
                            ),
                            hintText: 'Username',
                          )),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: _password,
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                          border: InputBorder.none,
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
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 50.0,
                      width: 150.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NavigationbarScreen(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffFE7551),
                        ),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 25.0, fontFamily: "SourceSansPro"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Don't Have an account?",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "SourceSansPro"),
                          children: [
                            TextSpan(
                                text: "Switch Account",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xffFE7551),
                                    fontFamily: "SourceSansPro",
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => SwitchAccountScreens(),
                                    ));
                                  })
                          ]),
                    ),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
