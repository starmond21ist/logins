import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
    focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(236, 2, 163, 238), width: 1)),
    enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(236, 2, 163, 238), width: 1)),
    errorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(236, 2, 163, 238), width: 1)));

NextPage(context, Page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Page));
}

NextPageReplace(context, Page) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Page,
      ));
}

void showSnackbar(
  context,
  color,
  message,
) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: TextStyle(fontSize: 14),
    ),
    backgroundColor: color,
    duration: Duration(seconds: 2),
    action: SnackBarAction(
      label: "Ok",
      onPressed: () {},
      textColor: Colors.white,
    ),
  ));
}
