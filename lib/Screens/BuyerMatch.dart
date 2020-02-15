import 'package:flutter/material.dart';
import '../Classes/Seller.dart';
import '../Classes/Database.dart';

class BuyerMatch extends StatelessWidget {
  DataBase DB = DataBase();
  static var now = DateTime.now();
  static var earlier = DateTime.parse("1969-07-20 20:18:04Z");
  List<Seller> Sellers = [
    Seller("pp", "TEST2@smol.com", 10, earlier, now, "Block")
  ];
  List<ListView> ListToDisplay = [];
  buildList() {
    DB.getSellers(DateTime.parse("1970-07-20 20:18:04Z"), DateTime.parse("1971-07-20 20:18:04Z"));


  }
 @override
  Widget build(BuildContext context) {
    buildList();
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
              children: Sellers.map((seller) {
                return Row(
                  children: <Widget>[
                    new Text(seller.name),
                    new Text(seller.email),
                  ]
                );
              }).toList()
              // <Widget>[
                // for (var i = 0; i < Sellers.length; i++) {
                //   Text(Sellers[i].name)
                // },
                // for (var seller = Sellers[0])
                // {

                // },
              //   ListView(
              //     children: <Widget>[
              //       Text("Element 1"),
              //       Text("Element 2")
              //     ],
              //   ),
              // ],
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