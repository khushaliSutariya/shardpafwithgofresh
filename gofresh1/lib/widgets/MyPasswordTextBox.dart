import 'package:flutter/material.dart';
class MyPasswordTextBox extends StatefulWidget{
  TextEditingController? passcontroller;
  FormFieldValidator passvalidator;
  String passhintText;
  MyPasswordTextBox({required this.passcontroller,required this.passvalidator,required this.passhintText});
  @override
  State<MyPasswordTextBox> createState() => _MyPasswordTextBoxState();
}

class _MyPasswordTextBoxState extends State<MyPasswordTextBox> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffFFFFFF),
      child: TextFormField(
        validator: widget.passvalidator,
        controller: widget.passcontroller,
        obscureText: _passwordVisible,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color(0xffFE7551), width: 2.0),
          ),
          enabledBorder: InputBorder.none,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)),
          hintText: widget.passhintText,
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Color(0xffC0C0C0),
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }

}
