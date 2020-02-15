import 'package:flutter/material.dart';

class Sell extends StatelessWidget {
  String email;
  String name;
  Sell(String _email, String _name) {
    email = _email;
    name = _name;
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dinex Daddy"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/buy');
                  },
                  child: Text('Block'),
                ),
              ]
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sell');
                  },
                  child: Text('Dinex'),
                )
              ],
            )

          ],
        ) 
      ),
    );
  } 
}