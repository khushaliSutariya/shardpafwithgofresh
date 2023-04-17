import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gofresh1/resources/StyleResources.dart';

class textlist {
  final String text;
  textlist({required this.text});
}

class ProductDetailScreens extends StatefulWidget {
  @override
  State<ProductDetailScreens> createState() => _ProductDetailScreensState();
}

class _ProductDetailScreensState extends State<ProductDetailScreens> {
  List<textlist> alltext = [
    textlist(text: "1Kg"),
    textlist(text: "500gm"),
    textlist(text: "2oogm"),
  ];

  final _pageController = PageController(viewportFraction: 0.877);

  int pageIndex = 0;
  int _itemCount = 1;

  void _decrementCounter() {
    setState(() {
      if (_itemCount > 1) {
        _itemCount--;
      }
    });
  }

  List<Widget> _demo = [
    Container(
      height: 300,
      child: Image.asset("img/Categories/Categoryinside/finger.png"),
    ),
    Container(
      height: 300,
      child: Image.asset("img/Categories/Categoryinside/finger.png"),
    ),
    Container(
      height: 300,
      child: Image.asset("img/Categories/Categoryinside/finger.png"),
    ),
  ];
  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        pageIndex = _pageController.page!.toInt();
        print(pageIndex);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            right: size.width * 0.05,
            top: size.height * 0.04,
            left: size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "img/Backarrow.png",
                    width: 20.0,
                    height: 20.0,
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xffFE7551)),
                  child: Center(
                      child: Image.asset(
                    "img/Categories/Categoryinside/like.png",
                    width: 20.0,
                  )),
                ),
              ],
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: PageView(
                physics: BouncingScrollPhysics(),
                children: _demo,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
              ),
            ),
            CarouselIndicator(
              count: _demo.length,
              index: pageIndex,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) {
                    return Container(
                      margin: EdgeInsets.only(right: 5),
                      alignment: Alignment.centerLeft,
                      height: 9,
                      width: 9,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: pageIndex == index
                            ? StyleResources.primaryColor
                            : Colors.black12,
                      ),
                    );
                  },
                ),
              ),
            ),
            Text("Organic Ladies Finger,Orka Veg"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("₹54",
                        style: TextStyle(color: StyleResources.primaryColor)),
                    Text("(1 kg)", style: TextStyle(color: Color(0xff858585))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: StyleResources.primaryColor),
                      ),
                      child: InkWell(
                          onTap: () => setState(() => _itemCount++),
                          child: Icon(
                            Icons.add,
                            size: 16.0,
                            color: StyleResources.primaryColor,
                          )),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      _itemCount.toString(),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: StyleResources.primaryColor),
                      ),
                      child: InkWell(
                          onTap: () => _decrementCounter(),
                          child: Icon(
                            Icons.remove,
                            size: 16.0,
                            color: StyleResources.primaryColor,
                          )),
                    ),
                  ],
                ),
              ],
            ),
            Text("Select Weight"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50.0,
                    width: size.width,
                    child: ListView.builder(
                      itemCount: alltext.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(alltext[index].text.toString()),
                                    ],
                                  )
                                ],
                              );
                            },
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
