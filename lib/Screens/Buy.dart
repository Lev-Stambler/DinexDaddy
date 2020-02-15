import 'package:flutter/material.dart';
class Buy extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    Color PrimaryColor = const Color(0xFFB71C1C);
    return Scaffold(
      appBar: AppBar(
        title: Text("Buyer Homepage"),
        backgroundColor: PrimaryColor,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/buyer-match');
            // Navigate back to confirm transaction
          },
          child: Text('Buy'),
        ),
      ),
    );
  } 
}
