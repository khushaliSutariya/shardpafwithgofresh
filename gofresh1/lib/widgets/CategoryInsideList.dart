import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gofresh1/Screens/category/ProductDetailScreens.dart';
import 'package:gofresh1/resources/StyleResources.dart';

class CategoryInsideList extends StatelessWidget {
  String firsttext = "";
  String secondtext = "";
  // String thirdtext = "";
  String firstimage;
  CategoryInsideList({
    required this.firsttext,
    required this.secondtext,
    // required this.thirdtext,
    required this.firstimage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0, left: 8.0, bottom: 8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetailScreens(),
              ));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(child: Image.asset(firstimage, height: 100.0)),
                Text(
                  firsttext,
                  style: TextStyle(
                      fontFamily: "SourceSansPro", fontWeight: FontWeight.w600),
                ),
                Text(
                  secondtext,
                  style: TextStyle(
                      fontFamily: "SourceSansPro", fontWeight: FontWeight.w600),
                ),
                Text(
                  "1 kg",
                  style: TextStyle(
                      fontFamily: "SourceSansPro",
                      fontWeight: FontWeight.w600,
                      color: Colors.black26),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '₹75',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                          WidgetSpan(
                            baseline: TextBaseline.alphabetic,
                            alignment: PlaceholderAlignment.belowBaseline,
                            child: Text(
                              '₹100',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 12,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0)),
                        color: StyleResources.primaryColor,
                      ),
                      child: Image.asset(
                          "img/Categories/Categoryinside/categorycart.png"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
