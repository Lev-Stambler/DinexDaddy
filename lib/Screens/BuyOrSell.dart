/*
TartanHacks 2020 Project: DINEX DADDY

Every semester, CMU undergraduates experience problems with having either too
much or too little dining credit. Our university does not allow for 
refunding of DineX or meal blocks, and credit does not roll over from semester 
to semester. To make matters worse, students (especially first-years) have a 
very small selection of unflexible meal plans they are forced to choose from.
As a result, at the end of every semester many students find themselves either
running out of credit and having to ration their food, or are drowning in DineX
and forced to go on impromptu Entropy runs in an effort to stop it from going 
to waste.

A popular solution has been for those with extra blocks and DineX to "sell"
their credit to those without, usually upperclassmen with an insufficient meal
plan. However, since the dining credit system does not allow for the electronic
transfer of funds, students have to meet up in person to "swipe" one another in.
This app is designed to facilitate that process, matching buyers to sellers
based on personal availability and listed price.


*/
import 'package:DinexDaddy/Screens/Sell.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class BuyOrSell extends StatelessWidget {
  //var rating = 0.0;
  String email;
  String name;
 @override
  Widget build(BuildContext context) {
    Color PrimaryColor = const Color(0xFFB71C1C);
    return Scaffold(
      appBar: AppBar(
        title: Text("Dinex Daddy"),
        backgroundColor: PrimaryColor,
        actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.feedback),
              onPressed: () {
                Navigator.pushNamed(context, '/feedback');
              },
            ),
        ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              child: Image.asset('lib/images/logo.png'),
              padding: EdgeInsets.only(bottom: 50),
              ),
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
                      builder: (context) => Sell())
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