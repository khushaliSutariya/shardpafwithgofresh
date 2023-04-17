import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SettingsScreens.dart';
import 'UserProfileScreens.dart';

class ProfileScreens extends StatefulWidget {
  const ProfileScreens({Key? key}) : super(key: key);

  @override
  State<ProfileScreens> createState() => _ProfileScreensState();
}

class _ProfileScreensState extends State<ProfileScreens> {
  var name = "";
  var email = "";
  getdata() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("username").toString();
      email = prefs.getString("useremail").toString();

    });

  }
  @override
  void initState() {
    super.initState();
    getdata();
  }
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
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
                                        'Profile',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "SourceSansPro",
                                            fontSize: 25.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: 60.0,
                              width: 55.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xffFE7551),
                              ),
                              child: Image.asset("img/profile_sc.png")),
                        ],
                      ),

                      Row(
                        children: [
                          CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage("img/user_account.png"),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          // StreamBuilder(
                          //   stream: FirebaseFirestore.instance.collection("gofresh").snapshots(),
                          //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          //   if(snapshot.hasData){
                          //     if(snapshot.data!.size<=0) {
                          //       return Center(
                          //         child: Text("No Data"),
                          //       );
                          //     }
                          //     else{
                          //       return  Column(
                          //         children: snapshot.data!.docs.map((document){
                          //             return  Column(
                          //               crossAxisAlignment: CrossAxisAlignment.start,
                          //               children: [
                          //                 Text(document["username"].toString(),
                          //                     style: TextStyle(
                          //                         fontSize: 20.0,
                          //                         fontFamily: "SourceSansPro",
                          //                         fontWeight: FontWeight.w700)),
                          //                 Text(document["useremail"].toString(),
                          //                 style: TextStyle(
                          //                 fontSize: 10.0,
                          //                 color: Colors.black38,
                          //                 fontFamily: "SourceSansPro")),
                          //               ],
                          //             );
                          //
                          //         }).toList(),
                          //
                          //
                          //       );
                          //     }
                          //   }
                          //   else{
                          //     return Center(
                          //       child: CircularProgressIndicator(),
                          //     );
                          //   }
                          // },),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: "SourceSansPro",
                                      fontWeight: FontWeight.w700)),
                              Text(email,
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      color: Colors.black38,
                                      fontFamily: "SourceSansPro")),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UserProfileScreens(),
                              ));
                            },
                            child: Card(
                              child: Container(
                                height: 55.0,
                                child: ListTile(
                                  title: Text("My Profile"),
                                  trailing: Image.asset("img/Backbutton.png",
                                      height: 20.0),
                                  leading: Image.asset("img/profile_icon.png",
                                      height: 20.0),
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
                                title: Text("My Order"),
                                trailing: Image.asset("img/Backbutton.png",
                                    height: 20.0),
                                leading: Image.asset("img/icons/order_icon.png",
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
                                title: Text("My Cards"),
                                trailing: Image.asset("img/Backbutton.png",
                                    height: 20.0),
                                leading: Image.asset("img/icons/cards_icon.png",
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
                                title: Text("Shipping Address"),
                                trailing: Image.asset("img/Backbutton.png",
                                    height: 20.0),
                                leading: Image.asset(
                                    "img/icons/shippingaddress_icon.png",
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
                                title: Text("Wishlist"),
                                trailing: Image.asset("img/Backbutton.png",
                                    height: 20.0),
                                leading: Image.asset(
                                    "img/icons/wishlist_icon.png",
                                    height: 20.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SettingsScreens(),
                              ));
                            },
                            child: Card(
                              child: Container(
                                height: 55.0,
                                child: ListTile(
                                  title: Text("Settings"),
                                  trailing: Image.asset("img/Backbutton.png",
                                      height: 20.0),
                                  leading: Image.asset(
                                      "img/icons/settings_icon.png",
                                      height: 20.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
