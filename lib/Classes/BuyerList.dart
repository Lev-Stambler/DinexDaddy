import 'package:flutter/material.dart';
import 'Seller.dart';

class SellerListTiles{
  static Widget getTile(Seller input){
    return Center(
    child: Container(
      color: input.typeSell == "Block"? Colors.green[50] : Colors.blue[50],
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("Type: ${input.typeSell}"),
              input.typeSell == "Block" ? Icon(Icons.fastfood) : Icon(Icons.attach_money)
          ],),
          Column(
            children: <Widget>[
              Text("Email: ${input.email}"),
              Text("Time Start: ${input.availableStart}"),
              Text("Time End: ${input.availableEnd}"),
          ],),
          Column(
            children: <Widget>[
              Text("Price: ${input.price}"),
          ],)
      ],),
    )
    );
  }
    
}
//start time, end time, email price, type 