import 'package:flutter/material.dart';
import 'package:gofresh1/resources/StyleResources.dart';

import '../Profile/ProfileScreen.dart';
import '../cart/CartScreen.dart';
import '../category/CategoryScreens.dart';
import 'Homepage.dart';

class NavigationbarScreen extends StatefulWidget {
  const NavigationbarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationbarScreen> createState() => _NavigationbarScreenState();
}

class _NavigationbarScreenState extends State<NavigationbarScreen> {
  var selected = 0;
  final pages = [Homepage(), CategoryScreen(), CartScreen(), ProfileScreens()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: pages[selected]),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xffFFFFFF),
              ),
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = 0;
                      });
                    },
                    child: Column(
                      children: [
                        (selected == 0)
                            ? Container(
                                height: 40.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: StyleResources.NavigationSelectColor,
                                ),
                                child: Center(
                                    child: Image.asset("img/Home.png",
                                        width: 20.0)),
                              )
                            : Container(
                                height: 40.0,
                                width: 60.0,
                                child: Center(
                                    child: Image.asset("img/Home.png",
                                        width: 20.0))),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = 1;
                      });
                    },
                    child: Column(
                      children: [
                        (selected == 1)
                            ? Container(
                                height: 40.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: StyleResources.NavigationSelectColor,
                                ),
                                child: Center(
                                    child: Image.asset("img/Category.png",
                                        width: 20.0)),
                              )
                            : Container(
                                height: 40.0,
                                width: 60.0,
                                child: Center(
                                  child: Image.asset(
                                    "img/Category.png",
                                    width: 20.0,
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Category",
                          style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = 2;
                      });
                    },
                    child: Column(
                      children: [
                        (selected == 2)
                            ? Container(
                                height: 40.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color:StyleResources.NavigationSelectColor,
                                ),
                                child: Center(
                                    child: Image.asset("img/Cart.png",
                                        width: 20.0)),
                              )
                            : Container(
                                height: 40.0,
                                width: 60.0,
                                child: Center(
                                  child: Image.asset(
                                    "img/Cart.png",
                                    width: 20.0,
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Cart",
                          style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = 3;
                      });
                    },
                    child: Column(
                      children: [
                        (selected == 3)
                            ? Container(
                                height: 40.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: StyleResources.NavigationSelectColor,
                                ),
                                child: Center(
                                    child: Image.asset("img/profile.png",
                                        width: 20.0)),
                              )
                            : Container(
                                height: 40.0,
                                width: 60.0,
                                child: Center(
                                  child: Image.asset(
                                    "img/profile.png",
                                    width: 18.0,
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
