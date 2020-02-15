import 'package:flutter/material.dart';

class Final extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmation Page"),
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