import 'package:flutter/material.dart';
class Buy extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buyer Homepage"),
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
