import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/MyPrimaryButton.dart';
import '../../widgets/MyTextBox.dart';
import 'ProfileScreen.dart';

class UserProfileScreens extends StatefulWidget {
  const UserProfileScreens({Key? key}) : super(key: key);

  @override
  State<UserProfileScreens> createState() => _UserProfileScreensState();
}

class _UserProfileScreensState extends State<UserProfileScreens> {
  TextEditingController _firstname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _dateofbirth = TextEditingController();

  ImagePicker _picker = ImagePicker();
  DateTime selectedDate = DateTime.now();

  File? selectedimage;
  var group = "M";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0,right: 15.0,),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Image.asset(
                          "img/Backarrow.png",
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.3),
                      Center(
                          child: Text(
                        "My Profile",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.w500),
                      )),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.white,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12.0,
                          child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0),
                                    ),
                                  ),
                                  builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 200,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Profile Photo"),
                                                IconButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                "Remove your profile photo?"),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                child: Text(
                                                                    "Cancel"),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                              TextButton(
                                                                child: Text(
                                                                    "Remove"),
                                                                onPressed:
                                                                    () {},
                                                              )
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    icon: Icon(Icons.delete)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    final XFile? image =
                                                        await _picker.pickImage(
                                                            source: ImageSource
                                                                .camera);

                                                    setState(() {
                                                      selectedimage =
                                                          File(image!.path);
                                                    });
                                                  },
                                                  child: Column(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            Colors.black38,
                                                        radius: 30.0,
                                                        child: Image.asset(
                                                            "img/icons/photo-camera.png",
                                                            width: 30.0),
                                                      ),
                                                      Text("Camera"),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20.0,
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    final XFile? image =
                                                        await _picker.pickImage(
                                                            source: ImageSource
                                                                .gallery);
                                                    setState(() {
                                                      selectedimage =
                                                          File(image!.path);
                                                    });
                                                  },
                                                  child: Column(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            Colors.black38,
                                                        radius: 30.0,
                                                        child: Image.asset(
                                                            "img/icons/image-gallery.png",
                                                            width: 30.0),
                                                      ),
                                                      Text("Gallery"),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            icon: Image.asset("img/Profile/imagepicker.png"),
                            color: Color(0xFF404040),
                          ),
                        ),
                      ),
                      radius: 38.0,
                      backgroundImage: selectedimage == null
                          ? AssetImage('img/Categories/user.png')
                              as ImageProvider
                          : FileImage(
                              File(selectedimage?.path ?? ''),
                            ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextBox(
                        controller: _firstname,
                        hintText: "First Name",
                        validator: (value) {},
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      MyTextBox(
                        controller: _lastname,
                        hintText: "Last Name",
                        validator: (value) {},
                      ),

                      SizedBox(
                        height: 20.0,
                      ),
                      MyTextBox(
                        controller: _email,
                        hintText: "Email Address",
                        validator: (value) {},
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        color: Color(0xffFFFFFF),
                        child: TextFormField(
                          validator: (value) {},
                          controller: _dateofbirth,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffFE7551), width: 2.0),
                              ),
                              enabledBorder: InputBorder.none,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              hintText: "Date Of Birth",
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  var pickedDate =
                                      await DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime(1947, 3, 5),
                                          maxTime: DateTime(2050, 6, 7),
                                          onChanged: (date) {
                                    print('change $date');
                                    setState(() {
                                      selectedDate = date;
                                    });
                                  }, onConfirm: (date) {
                                    print('confirm $date');
                                    setState(() {
                                      selectedDate = date;
                                    });
                                  },
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.en);
                                  if (pickedDate != null) {
                                    _dateofbirth.text =
                                        DateFormat('dd MMMM yyyy')
                                            .format(pickedDate);
                                  }
                                },
                                icon: Image.asset("img/Profile/datepicker.png",
                                    height: 15.0),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Gender:- ",
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.brown.shade400),
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.brown.shade400),
                          ),
                          Radio(
                            value: "M",
                            groupValue: group,
                            onChanged: (value) {
                              setState(() {
                                value = group;
                              });
                            },
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.brown.shade400),
                          ),
                          Radio(
                            value: "F",
                            groupValue: group,
                            onChanged: (value) {
                              setState(() {
                                value = group;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      // Row(
                      //   children: [
                      //     IconButton(
                      //       onPressed: () {
                      //         DatePicker.showDatePicker(context,
                      //             showTitleActions: true,
                      //             minTime: DateTime(1947, 3, 5),
                      //             maxTime: DateTime(2050, 6, 7),
                      //             onChanged: (date) {
                      //           print('change $date');
                      //           setState(() {
                      //             selectedDate = date;
                      //           });
                      //         }, onConfirm: (date) {
                      //           print('confirm $date');
                      //           setState(() {
                      //             selectedDate = date;
                      //           });
                      //         },
                      //             currentTime: DateTime.now(),
                      //             locale: LocaleType.en);
                      //       },
                      //       icon: Icon(Icons.date_range),
                      //     ),
                      //     Text(
                      //       "Date:- ${DateFormat.yMMMd().format(selectedDate)}",
                      //       style: TextStyle(
                      //           fontSize: 20.0, color: Colors.brown.shade400),
                      //     )
                      //   ],
                      // ),
                      Center(
                        child: MyPrimaruButton(
                          buttonText: 'Update',
                          onclick: () async {
                            setState(() {
                              var nm = _firstname.text.toString();
                              print("fullname" + nm);
                              var ph = _lastname.text.toString();
                              print("phone" + ph);
                              var email = _email.text.toString();
                              print("email" + email);
                              // var pass = _password.text.toString();
                              // print("password" + pass);
                            });
                            _firstname.text = "";
                            _lastname.text = "";
                            _email.text = "";
                            // _password.text = "";
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            // prefs.setString("image", selectedimage as String);
                            prefs.setString(
                                "username", _firstname.text.toString());
                            prefs.setString(
                                "userphone", _lastname.text.toString());
                            prefs.setString(
                                "useremail", _email.text.toString());
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfileScreens(),
                            ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
