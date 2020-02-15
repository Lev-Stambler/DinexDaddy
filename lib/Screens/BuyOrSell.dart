import 'package:flutter/material.dart';
class BuyOrSell extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dinex Daddy"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/buy');
              },
              child: Text('Buy'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sell');
              },
              child: Text('Sell'),
            )

          ],
        ) 
        // child: RaisedButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, '/buy');
        //   },
        //   child: Text('Buy'),
        // ),
      ),
    );
  } 
}