import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gofresh1/resources/StyleResources.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gofresh1/widgets/MyPrimaryButton.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _itemCount = 1;
  void _decrementCounter() {
    setState(() {
      if (_itemCount > 1) {
        _itemCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleResources.scaffoldbackgroundcolor,
      body: Stack(
        children: [
          Image.asset(
            "img/Background.png",
            color: Color(0xfffbedee),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.06,
                  ),
                  child: Row(
                    children: [
                      Image.asset("img/Backarrow.png"),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.35),
                      Text("My Cart", style: TextStyle(fontSize: 20.0)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 500.0,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                print("delete");
                              },
                              background: Container(
                                height: 100.0,
                                margin: const EdgeInsets.all(5.0),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Colors.red,
                                ),
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Image.asset(
                                      "img/Categories/Categoryinside/delete.png",
                                      color: Colors.white,height: 25.0,),
                                ),
                              ),
                              child: Card(
                                  child: Container(
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                  "img/Cart/strawberry.png",
                                                  height: 80.0),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Fresh Strawberry",
                                                          style: TextStyle(
                                                              fontSize: 15.0,
                                                              fontFamily:
                                                                  "SourceSansPro")),
                                                      SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.45),
                                                      Container(
                                                        height: 25.0,
                                                        width: 25.0,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            border: Border.all(
                                                                width: 2.0,
                                                                color: StyleResources
                                                                    .primaryColor)),
                                                        child: InkWell(
                                                            onTap: () =>
                                                                setState(() =>
                                                                    _itemCount++),
                                                            child: Icon(
                                                              Icons.add,
                                                              size: 16.0,
                                                              color: StyleResources
                                                                  .primaryColor,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "1 kg",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "SourceSansPro",
                                                            color:
                                                                Colors.black26),
                                                      ),
                                                      SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.6),
                                                      Text(_itemCount
                                                          .toString()),
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      RichText(
                                                        text: const TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: '₹54',
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            WidgetSpan(
                                                              baseline:
                                                                  TextBaseline
                                                                      .alphabetic,
                                                              alignment:
                                                                  PlaceholderAlignment
                                                                      .belowBaseline,
                                                              child: Text(
                                                                '₹60',
                                                                style:
                                                                    TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black26,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.55),
                                                      Container(
                                                        height: 25.0,
                                                        width: 25.0,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            border: Border.all(
                                                                width: 2.0,
                                                                color: StyleResources
                                                                    .primaryColor)),
                                                        child: InkWell(
                                                            onTap: () =>
                                                                _decrementCounter(),
                                                            child: Icon(
                                                              Icons.remove,
                                                              size: 16.0,
                                                              color: StyleResources
                                                                  .primaryColor,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ))),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total : ",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "SourceSansPro",
                            fontWeight: FontWeight.w600),
                      ),
                      MyPrimaruButton(
                        buttonText: "Place Order",
                        onclick: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
