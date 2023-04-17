import 'package:flutter/material.dart';

class MyRadioButton extends StatefulWidget {
  const MyRadioButton({Key? key}) : super(key: key);

  @override
  State<MyRadioButton> createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  var group = 'Most Popular';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left: 20.0,right: 10.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Most Popular',
              ),
              Radio(
                value: "Most Popular",
                groupValue: group,
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    group = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Items',
              ),
              Radio(
                value: "New Items",
                groupValue: group,
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    group = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price: High To Low',
              ),
              Radio(
                value: "Price: High To Low",
                groupValue: group,
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    group = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price: Low To High',
              ),
              Radio(
                value: "Price: Low To High",
                groupValue: group,
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    group = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '4.0+ Rating',
              ),
              Radio(
                value: "4.0+ Rating",
                groupValue: group,
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    group = value!;
                  });
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
