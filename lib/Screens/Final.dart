import 'package:flutter/material.dart';

class Final extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    Color PrimaryColor = const Color(0xFFB71C1C);
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmation Page"),
        backgroundColor: PrimaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Transaction Confirmed', 
            style: TextStyle(fontWeight: FontWeight.bold),),
            Text('Meet With:'), 
            Text('Location:'),
            Text('Time:'),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/buy-or-sell');
              },
              child: Text('Home'),
            )
          ],
        ) 
      ),
    );
  } 
  
}