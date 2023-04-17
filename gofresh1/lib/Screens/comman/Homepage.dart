import 'package:flutter/material.dart';
import 'package:gofresh1/resources/StyleResources.dart';

import '../cart/CartScreen.dart';
import '../category/CategoryScreens.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: StyleResources.scaffoldbackgroundcolor,
        body: SafeArea(
      child: Column(
        children: [
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
                                      Image.asset("img/Vector.png"),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        'Work',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "SourceSansPro",
                                            fontSize: 25.0),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Image.asset("img/arrow.png",
                                          width: 15.0, height: 20.0),
                                    ],
                                  ),
                                ),
                                Text(
                                  '419,Platinium Point,O/P Cng Petrol Pump...',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontFamily: "SourceSansPro",
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
                              child: Image.asset("img/ball.png")),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: Image.asset("img/banner1.png"),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Shop By Categories",
                            style: TextStyle(
                                fontFamily: "SourceSansPro",
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.32),
                          Text(
                            "View All",
                            style: TextStyle(
                                fontFamily: "SourceSansPro",
                                fontSize: 15.0,
                                color: Colors.black26),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: size.height * 0.13,
                                width: size.width * 0.27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xffE2F5FF),
                                ),
                                child: Center(
                                    child: Image.asset(
                                        "img/Categories/vegetables.png",
                                        width: 85.0)),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "vegetables",
                                style: TextStyle(
                                    fontFamily: "SourceSansPro",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 17.0,
                          ),
                          Column(
                            children: [
                              Container(
                                height: size.height * 0.13,
                                width: size.width * 0.27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xffFFEBE6),
                                ),
                                child: Center(
                                    child: Image.asset(
                                        "img/Categories/Fruits.png",
                                        width: 85.0)),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Fruits",
                                style: TextStyle(
                                    fontFamily: "SourceSansPro",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 17.0,
                          ),
                          Column(
                            children: [
                              Container(
                                height: size.height * 0.13,
                                width: size.width * 0.27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xffFFF4D8),
                                ),
                                child: Center(
                                    child: Image.asset(
                                        "img/Categories/Bakery.png",
                                        width: 85.0)),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Bakery",
                                style: TextStyle(
                                    fontFamily: "SourceSansPro",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: size.height * 0.13,
                                width: size.width * 0.27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xffF9EEFF),
                                ),
                                child: Center(
                                    child: Image.asset(
                                        "img/Categories/Atta-Maida.png",
                                        width: 85.0)),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Atta & maida",
                                style: TextStyle(
                                    fontFamily: "SourceSansPro",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 17.0,
                          ),
                          Column(
                            children: [
                              Container(
                                height: size.height * 0.13,
                                width: size.width * 0.27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xffEDEFFF),
                                ),
                                child: Center(
                                    child: Image.asset(
                                        "img/Categories/Beverages.png",
                                        width: 85.0)),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Beverages",
                                style: TextStyle(
                                    fontFamily: "SourceSansPro",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 17.0,
                          ),
                          Column(
                            children: [
                              Container(
                                height: size.height * 0.13,
                                width: size.width * 0.27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xffE3F8E0),
                                ),
                                child: Center(
                                    child: Image.asset(
                                        "img/Categories/Snacks.png",
                                        width: 85.0)),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Snacks",
                                style: TextStyle(
                                    fontFamily: "SourceSansPro",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: size.height * 0.13,
                                width: size.width * 0.27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xffE3F8E0),
                                ),
                                child: Center(
                                    child: Image.asset(
                                        "img/Categories/Babycare.png",
                                        width: 85.0)),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Baby Care",
                                style: TextStyle(
                                    fontFamily: "SourceSansPro",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 17.0,
                          ),
                          Column(
                            children: [
                              Container(
                                height: size.height * 0.13,
                                width: size.width * 0.27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xffFFEBE6),
                                ),
                                child: Center(
                                    child: Image.asset(
                                        "img/Categories/Personalcare.png",
                                        width: 85.0)),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Personal Care",
                                style: TextStyle(
                                    fontFamily: "SourceSansPro",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 17.0,
                          ),
                          Column(
                            children: [
                              Container(
                                height: size.height * 0.13,
                                width: size.width * 0.27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xffFFF4D8),
                                ),
                                child: Center(
                                    child: Image.asset(
                                        "img/Categories/Housecleaning.png",
                                        width: 85.0)),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "House Cleaning",
                                style: TextStyle(
                                    fontFamily: "SourceSansPro",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Fruits & Vegetables",
                            style: TextStyle(
                                fontFamily: "SourceSansPro",
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35),
                          Text(
                            "View All",
                            style: TextStyle(
                                fontFamily: "SourceSansPro",
                                fontSize: 15.0,
                                color: Colors.black26),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: size.height * 0.3,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Row(
                              children: [
                                Container(
                                  width: size.width * 0.35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Color(0xffFFFFFF),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Image.asset(
                                                "img/Categories/strawberry.png"),
                                            Text(
                                              "Freshly packed strawberry Fruits",
                                              style: TextStyle(
                                                  fontFamily: "SourceSansPro",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "1 Kg",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "SourceSansPro",
                                                            color:
                                                                Colors.black38),
                                                      ),
                                                      SizedBox(
                                                        height: 7.0,
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text("₹125",
                                                            style: TextStyle(
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    "SourceSansPro")),
                                                        Text(
                                                          "₹200",
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              color: Colors
                                                                  .black38,
                                                              fontFamily:
                                                                  "SourceSansPro"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                                height: 40.0,
                                                width: 50.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20.0)),
                                                  color: Color(0xffFE7551),
                                                ),
                                                padding: EdgeInsets.all(10.0),
                                                child: Image.asset(
                                                    "img/Shoppingbeg.png")),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  width: size.width * 0.35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Color(0xffFFFFFF),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Image.asset(
                                                "img/Categories/Coriander.png"),
                                            Text(
                                              "Fresh Organic  Coriander Leaves",
                                              style: TextStyle(
                                                  fontFamily: "SourceSansPro",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "1 Kg",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "SourceSansPro",
                                                            color:
                                                                Colors.black38),
                                                      ),
                                                      SizedBox(
                                                        height: 7.0,
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text("₹75",
                                                            style: TextStyle(
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    "SourceSansPro")),
                                                        Text(
                                                          "₹100",
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              color: Colors
                                                                  .black38,
                                                              fontFamily:
                                                                  "SourceSansPro"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                                height: 40.0,
                                                width: 50.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20.0)),
                                                  color: Color(0xffFE7551),
                                                ),
                                                padding: EdgeInsets.all(10.0),
                                                child: Image.asset(
                                                    "img/Shoppingbeg.png")),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),

        ],
      ),
    ));
  }
}
