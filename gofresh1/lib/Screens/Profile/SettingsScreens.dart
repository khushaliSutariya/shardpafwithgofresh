import 'package:flutter/material.dart';
import 'package:gofresh1/auth/Loginpage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'LogExistingAccountScreens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreens extends StatefulWidget {
  const SettingsScreens({Key? key}) : super(key: key);

  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {

  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Stack(children: [
                Image.asset(
                  "img/Background.png",
                  color: Color(0xfffbedee),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20.0, left: 20.0, bottom: 20.0, top: 30.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    children: [
                                      Image.asset("img/left_back_icon.png",
                                          width: 15.0, height: 20.0),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.27,
                                      ),
                                      Text(
                                        'Setting',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "SourceSansPro",
                                            fontSize: 25.0),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Card(
                                  child: Container(
                                    height: 55.0,
                                    child: ListTile(
                                      title: Text("Dark Theme"),
                                      trailing: Switch(
                                        activeColor: Colors.deepOrange,
                                        value: status,
                                        onChanged: (value) {
                                          print("VALUE : $value");
                                          setState(() {
                                            status = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Card(
                                  child: Container(
                                    height: 55.0,
                                    child: ListTile(
                                      title: Text("Notification"),
                                      trailing: Switch(
                                        activeColor: Colors.deepOrange,
                                        value: status,
                                        onChanged: (value) {
                                          print("VALUE : $value");
                                          setState(() {
                                            status = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Card(
                                  child: Container(
                                    height: 55.0,
                                    child: ListTile(
                                      title: Text("Payment Method"),
                                      trailing: Image.asset(
                                          "img/Backbutton.png",
                                          height: 20.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Card(
                                  child: Container(
                                    height: 55.0,
                                    child: ListTile(
                                      title: Text("Privacy Policy"),
                                      trailing: Image.asset(
                                          "img/Backbutton.png",
                                          height: 20.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Card(
                                  child: Container(
                                    height: 55.0,
                                    child: ListTile(
                                      title: Text("Terms & Conditions"),
                                      trailing: Image.asset(
                                          "img/Backbutton.png",
                                          height: 20.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text("Logins"),
                                TextButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return SizedBox(
                                              height: 150.0,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text("Add account",
                                                      style: TextStyle(
                                                          fontSize: 20.0)),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .push(
                                                                MaterialPageRoute(
                                                          builder: (context) =>
                                                              LogExistingAccountScreens(),
                                                        ));
                                                      },
                                                      child: Container(
                                                        height: 40.0,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          color: Colors.blue,
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                          "Log into existing account",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                  TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                          "Create new account")),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    child: Text("Add account")),
                                TextButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Log Out'),
                                            actions: [
                                              ElevatedButton(
                                                child: Text('Log out'),
                                                onPressed: () async {
                                                  SharedPreferences prefs =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  prefs.remove("login");
                                                  GoogleSignIn googleSignIn = GoogleSignIn();
                                                  googleSignIn.signOut();
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        Loginpage(),
                                                  ));
                                                },
                                              ),
                                              ElevatedButton(
                                                child: Text('Cancel'),
                                                onPressed: () {





                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Text("Log out")),
                              ],
                            ),
                          ),
                        ]),
                      ]),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
