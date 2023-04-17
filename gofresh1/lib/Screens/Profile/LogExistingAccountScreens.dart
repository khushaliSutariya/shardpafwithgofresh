import 'package:flutter/material.dart';

import 'SignupScreens.dart';
import 'SwitchAccountScreens.dart';

class LogExistingAccountScreens extends StatefulWidget {
  const LogExistingAccountScreens({Key? key}) : super(key: key);

  @override
  State<LogExistingAccountScreens> createState() =>
      _LogExistingAccountScreensState();
}

class _LogExistingAccountScreensState extends State<LogExistingAccountScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SwitchAccountScreens(),
                  ));
                },
                child: Container(
                    height: 50.0,
                    child: Center(child: Text("Switch Accounts"))),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignupScreens(),
                  ));
                },
                child: Container(
                    height: 50.0, child: Center(child: Text("Sign up"))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
