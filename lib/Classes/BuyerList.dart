import 'package:flutter/material.dart';
import 'Seller.dart';
import 'package:url_launcher/url_launcher.dart';

class SellerListTiles{
  static Widget getTile(Seller input){
    return Center(
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              color: input.typeSell == "Block"? Colors.green[50] : Colors.blue[50],
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                children: <Widget>[
                  Center(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            // Text("Type: ${input.typeSell}"),
                            input.typeSell == "Block" ? Icon(Icons.fastfood) : Icon(Icons.attach_money)
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text("Email: ${input.email}"),
                            Text("Time Start: ${input.availableStart}"),
                            Text("Time End: ${input.availableEnd}"),
                            Text("Price ${input.typeSell == 'Block' ? 'per block' : 'per \$5 of Dinex'}: ${input.price}"),
                          ],
                        ),
                      ],
                    )
                  ),
                  Container(
                      width: 200,
                      child: RaisedButton(
                        child: Center(child: Text("Send Email")),
                        onPressed: (){
                          _launchURL(input.email);
                        },
                      ),
                    )
                ],
              ),
            )
          )
        ]
      ),
    );
  }
}
//start time, end time, email price, type 

_launchURL(input) async {
  var url = 'mailto:${input}?subject=News&body=New%20plugin';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}