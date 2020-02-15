import 'package:flutter/material.dart';
import '../Classes/Seller.dart';

class BuyerMatch extends StatelessWidget {
  List<Seller> Sellers = [
    // Seller("pp", "pp@smol.com", 10, 15),
    
    // Seller("shSmol", "pp@smol.com", 1, 5),
  ];
  List<ListView> ListToDisplay = [];
  buildList(){
    for(var i = 0; i < Sellers.length; i++){
      ListToDisplay.add(
        ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("FUCK THIS SHIT")
                // Text(Sellers[i].name),
                // Text(Sellers[i].email),
                // Text(Sellers[i].dinexPrice.toString()),      
                // Text(Sellers[i].blockPrice.toString()),      
              ],
              ),
          ],
        )
      );

    }
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