import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as fluttertoast;


void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Button Test"),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                fluttertoast.Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: fluttertoast.Toast.LENGTH_SHORT,
        gravity: fluttertoast.ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
                print("Button Pressed");
              },
              child: Text("Press Me"),
            ),
          ),
        ),
      ),
    );  