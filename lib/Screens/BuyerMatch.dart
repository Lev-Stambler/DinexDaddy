import 'package:flutter/material.dart';

class BuyerMatch extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matches"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/buy');
            // Navigate back to first screen when tapped.
          },
          child: Text('Back'),
        ),
      ),
    );
  } 
}