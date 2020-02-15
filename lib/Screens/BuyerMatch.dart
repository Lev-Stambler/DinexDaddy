import 'package:DinexDaddy/Screens/Sell.dart';
import 'package:flutter/material.dart';
import '../Classes/Seller.dart';
import '../Classes/Database.dart';

class BuyerMatch extends StatefulWidget {
  DateTime startTime;
  DateTime endTime;

  BuyerMatch(this.startTime, this.endTime);
  @override
  _BuyerMatch createState() {
    return _BuyerMatch(startTime, endTime);
  }
}
class _BuyerMatch extends State {
  DataBase db = DataBase();
  DateTime startTime;
  DateTime endTime;
  List<Seller> Sellers = [];

  Future<List<Seller>> buildList() async {
    Sellers = await db.getSellers(startTime, endTime, "Block");
    return Sellers;
  }

  _BuyerMatch(this.startTime, this.endTime);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Seller>>(
      future: buildList(), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<List<Seller>> snapshot) {  // AsyncSnapshot<Your object type>
        if(snapshot.connectionState == ConnectionState.waiting){
          return Scaffold(body: Center(child: Text('Please wait while everything loads...')));
        } else{
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else
              return Scaffold(body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row (
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: snapshot.data.map((seller) {
                        return SellerShow(seller);
                      }).toList()
                    )]
                  )
                ));
              }
      },
    );
  }
}
class SellerShow extends StatelessWidget {
  //var rating = 0.0;
  Seller s;
  SellerShow(this.s);
 @override
  Widget build(BuildContext context) {
    return Center (
        child: Row(children: <Widget>[
          Text("Email: " + s.email),
          Text("Name: " + s.name),
        ],)
    );
  }
}


//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Matches"),
//       ),
//               // <Widget>[
//                 // for (var i = 0; i < Sellers.length; i++) {
//                 //   Text(Sellers[i].name)
//                 // },
//                 // for (var seller = Sellers[0])
//                 // {

//                 // },
//               //   ListView(
//               //     children: <Widget>[
//               //       Text("Element 1"),
//               //       Text("Element 2")
//               //     ],
//               //   ),
//               // ],
//             )

//           ],
//         ) 
//         // child: RaisedButton(
//         //   onPressed: () {
//         //     Navigator.pushNamed(context, '/buy');
//         //   },
//         //   child: Text('Buy'),
//         // ),
//       ),
//     );
