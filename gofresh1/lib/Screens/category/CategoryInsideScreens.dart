import 'package:flutter/material.dart';
import 'package:gofresh1/handler/DatabaseHandlar.dart';
import '../../resources/StyleResources.dart';
import '../../widgets/CategoryInsideList.dart';
import '../../widgets/MyPrimaryButton.dart';
import '../../widgets/MyRadioButton.dart';
import 'CategoryInsideFilterScreens.dart';

class CategoryInsideScreens extends StatefulWidget {
  @override
  State<CategoryInsideScreens> createState() => _CategoryInsideScreensState();
}

class _CategoryInsideScreensState extends State<CategoryInsideScreens> {
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
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: StyleResources.scaffoldbackgroundcolor,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    "img/Background.png",
                    color: Color(0xfffbedee),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "img/Backarrow.png",
                          width: 20.0,
                          height: 20.0,
                        ),
                      ),
                      SizedBox(width: size.width * 0.3),
                      Text("Vegetables",
                          style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0)),
                      SizedBox(width: size.width * 0.3),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xffFE7551)),
                        child: Center(
                            child: Image.asset(
                          "img/Search.png",
                          width: 20.0,
                        )),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 50.0, right: 10.0, left: 10.0),
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(12.0),
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        children: [
                          Card(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 20.0, left: 8.0, bottom: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Center(
                                      child: Image.asset(
                                          "img/Categories/Categoryinside/tomato.png",
                                          height: 100.0)),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Farm Fresh Tomato",
                                          style: TextStyle(
                                              fontFamily: "SourceSansPro",
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Container(
                                          height: 18.0,
                                          width: 18.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xffFFEBE6),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: InkWell(
                                              onTap: () =>
                                                  setState(() => _itemCount++),
                                              child: Icon(
                                                Icons.add,
                                                size: 16.0,
                                                color:
                                                    StyleResources.primaryColor,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Hybrid",
                                        style: TextStyle(
                                            fontFamily: "SourceSansPro",
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                          height: 30.0,
                                          width: 38.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15.0),
                                                bottomLeft:
                                                    Radius.circular(15.0)),
                                            color: StyleResources.primaryColor,
                                          ),
                                          child: Center(
                                              child: Text(
                                            _itemCount.toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "2 kg",
                                        style: TextStyle(
                                            fontFamily: "SourceSansPro",
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black26,
                                            fontSize: 10.0),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "1 kg",
                                              style: TextStyle(
                                                  fontFamily: "SourceSansPro",
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black26,
                                                  fontSize: 10.0),
                                            ),
                                            Container(
                                              height: 18.0,
                                              width: 18.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                color: Color(0xffFFEBE6),
                                              ),
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
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "500 gm",
                                    style: TextStyle(fontSize: 10.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CategoryInsideList(
                            firstimage:
                                "img/Categories/Categoryinside/corinder.png",
                            firsttext: "Farm Organic",
                            secondtext: "Coriander Leaves",
                          ),
                          CategoryInsideList(
                            firstimage:
                                "img/Categories/Categoryinside/finger.png",
                            firsttext: "Organic Ladies Finger",
                            secondtext: "Orka Veg",
                          ),
                          CategoryInsideList(
                            firstimage:
                                "img/Categories/Categoryinside/lemon.png",
                            firsttext: "Exotic Fresh Lemon",
                            secondtext: "(Loose)",
                          ),
                          CategoryInsideList(
                            firstimage:
                                "img/Categories/Categoryinside/potato.png",
                            firsttext: "Fresho Potato-",
                            secondtext: "Organically Grown",
                          ),
                          CategoryInsideList(
                            firstimage:
                                "img/Categories/Categoryinside/cucumber.png",
                            firsttext: "Organic Cucumber-",
                            secondtext: "Naturally Grown",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.1,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    color: Color(0xffFFEBE4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                builder: (context) {
                                  return Container(
                                    height: 400.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Sort By",
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontFamily: "SourceSansPro",
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.clear)),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Expanded(child: MyRadioButton())
                                            ],
                                          ),
                                        ),
                                        Center(
                                          child: MyPrimaruButton(
                                            buttonText: "Apply",
                                            onclick: () {},
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          icon: Image.asset(
                              "img/Categories/Categoryinside/sort.png",
                              height: 25.0),
                        ),
                        Text("Sort",
                            style: TextStyle(
                                fontFamily: "SourceSansPro",
                                color: StyleResources.primaryColor)),
                      ],
                    ),
                    VerticalDivider(
                      color: Color(0xffB77158),
                      thickness: 2,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                builder: (context) {
                                  return Container(
                                      height: size.height*0.4,
                                      child: Padding(
                                      padding:  EdgeInsets.only(left: 15.0,right: 15.0),
                                  child:CategoryInsideFilterScreens()));
                                });
                          },
                          icon: Image.asset(
                              "img/Categories/Categoryinside/filter.png",
                              height: 20.0),
                        ),
                        Text("Filter",
                            style: TextStyle(
                                fontFamily: "SourceSansPro",
                                color: StyleResources.primaryColor)),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
