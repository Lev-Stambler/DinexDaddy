import 'package:DinexDaddy/Screens/Sell.dart';
import 'package:flutter/material.dart';
class BuyOrSell extends StatelessWidget {
  String email;
  String name;
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
                  child: Text('Buy'),
                ),
              ]
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Sell(email, name))
                    );
                  },
                  child: Text('Sell'),
                )
              ],
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