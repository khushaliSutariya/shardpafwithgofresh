import 'package:flutter/material.dart';

import '../../resources/StyleResources.dart';
import '../../widgets/MyPrimaryButton.dart';
class CategoryInsideFilterScreens extends StatefulWidget {
  const CategoryInsideFilterScreens({Key? key}) : super(key: key);

  @override
  State<CategoryInsideFilterScreens> createState() => _CategoryInsideFilterScreensState();
}

class _CategoryInsideFilterScreensState extends State<CategoryInsideFilterScreens> {
  RangeValues values = RangeValues(10, 150);
  double _currentSliderValue = 0;
  TextStyle kTextStyle = TextStyle(
    fontSize: 10.0,color: Colors.black45,
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    RangeLabels labels = RangeLabels(values.start.toString(), values.end.toString());

    return Scaffold(
      body: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Filter",
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
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Distance",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "SourceSansPro",)),
              Text("10km",style: TextStyle(color: StyleResources.primaryColor,fontFamily: "SourceSansPro",)),
            ],
          ),
          Slider(
            value: _currentSliderValue,
            min: 0,
            max: 100,
            divisions: 100,
            label: _currentSliderValue
                .round()
                .toString(),
            activeColor: StyleResources.primaryColor,
            inactiveColor: Color(0xffF3F3F3),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;

              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '5km',
                style: kTextStyle,
              ),
              Text(
                '10km',
                style: kTextStyle,
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Price",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "SourceSansPro")),
              Text("₹10-₹150",style: TextStyle(color: StyleResources.primaryColor,fontFamily: "SourceSansPro",)),
            ],
          ),
          RangeSlider(
            min: 10,
            max: 150,
            labels: labels,
            divisions: 10,
            activeColor: StyleResources.primaryColor,
            inactiveColor: Color(0xffF3F3F3),
            values: values, onChanged: (newvalue) {

            setState(() {
              values = newvalue;
            });
          },),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹10',
                style: kTextStyle,
              ),
              Text(
                '₹150',
                style: kTextStyle,
              ),
            ],
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
  }
}
