import 'package:flutter/material.dart';
import '../Classes/Seller.dart';

class BuyerMatch extends StatelessWidget {
  List<Seller> Sellers = [];
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matches"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                for (var seller = Sellers[0])
                {

                }
                ListView(
                  children: <Widget>[
                    Text("Element 1"),
                    Text("Element 2")
                  ],
                ),
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