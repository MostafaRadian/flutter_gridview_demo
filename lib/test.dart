import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          decoration: BoxDecoration(
            color: Colors.pinkAccent.withOpacity(.3),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.pink),
              label: Text("Hello field"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.pink),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
