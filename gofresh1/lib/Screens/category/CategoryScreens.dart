import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:gofresh1/Screens/category/CategoryInsideScreens.dart';
import 'package:gofresh1/handler/DatabaseHandlar.dart';

class categorys {
  final String image;
  final String Text;
  final Color color;
  categorys({required this.image, required this.Text, required this.color});
}

class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<categorys> images = [
    categorys(
      image: "img/Categories/vegetables.png",
      Text: "Vegetables",
      color: Color(0xffE2F5FF),
    ),
    categorys(
      image: "img/Categories/Fruits.png",
      Text: "Fruits",
      color: Color(0xffFFEBE6),
    ),
    categorys(
      image: "img/Categories/Bakery.png",
      Text: "Bakery",
      color: Color(0xffFFF4D8),
    ),
    categorys(
      image: "img/Categories/Atta-Maida.png",
      Text: "Atta & Maida",
      color: Color(0xffF9EEFF),
    ),
    categorys(
      image: "img/Categories/Beverages.png",
      Text: "Beverages",
      color: Color(0xffEDEFFF),
    ),
    categorys(
      image: "img/Categories/Snacks.png",
      Text: "Snacks",
      color: Color(0xffE3F8E0),
    ),
    categorys(
      image: "img/Categories/Babycare.png",
      Text: "Baby Care",
      color: Color(0xffE2F5FF),
    ),
    categorys(
      image: "img/Categories/Personalcare.png",
      Text: "Personal Care",
      color: Color(0xffFFEBE6),
    ),
    categorys(
      image: "img/Categories/Housecleaning.png",
      Text: "House Cleaning",
      color: Color(0xffFFF4D8),
    ),
    categorys(
      image: "img/Categories/Dal-Pulses.png",
      Text: "Dal & Pulses",
      color: Color(0xffE3F8E0),
    ),
    categorys(
      image: "img/Categories/Noodles-Pasta.png",
      Text: "Noodles & Pasta",
      color: Color(0xffF9EEFF),
    ),
    categorys(
      image: "img/Categories/Mask-sanitisers.png",
      Text: "Mask & Sanitisers",
      color: Color(0xffE2F5FF),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                      SizedBox(width: size.width * 0.1),
                      Text("Shop By Categories",
                          style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0)),
                      SizedBox(width: size.width * 0.2),
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
                    padding: EdgeInsets.only(top: 60.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: images.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    height: size.height * 0.2,
                                    width: size.width * 0.4,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: images[index].color),
                                    child: InkWell(
                                        onTap: () async{
                                          // var allproduct = images;
                                          // DatabaseHandlar obj = new DatabaseHandlar();
                                          // var id = await obj.insertproduct(allproduct);
                                          // print("Record inserted:"+id.toString());
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                CategoryInsideScreens(),
                                          ));
                                        },
                                        child:
                                            Image.asset(images[index].image)),
                                  ),
                                  Text(
                                    images[index].Text,
                                    style: TextStyle(
                                        fontFamily: "SourceSansPro",
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
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
