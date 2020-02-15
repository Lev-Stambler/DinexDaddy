import 'package:flutter/material.dart';

class Final extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmation Page"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/buyer-match');
              },
              child: Text('Back'),
            ),
            RaisedButton(
              onPressed: () {
                //Navigator.pushNamed(context, '/sell');
              },
              child: Text('Confirm'),
            )
          ],
        ) 
      ),
    );
  } 
  
}