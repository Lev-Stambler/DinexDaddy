import 'package:DinexDaddy/Classes/Seller.dart';
import 'package:DinexDaddy/Screens/Sell.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;

class DataBase{
  fs.Firestore store;
  DataBase() {
    store = firestore();
  }
  addSeller(Seller s){
    store.collection('sellers').add({
      "email": s.email,
      "name": s.name,
      "availableStart": s.availableStart,
      "availableEnd": s.availableEnd,
      "typeSell": s.typeSell,
      "price": s.price,
    });
  }

  Future<List<Seller>> getSellers(DateTime buyerStart, DateTime buyerEnd, String typeSell) async{
    // .where("availableEnd", '<=', buyerEnd)
    fs.QuerySnapshot refs = await store.collection('sellers').where("availableStart", '<=', buyerStart).where("typeSell", "==", typeSell).get();
    List<Seller> sellers = [];
    refs.forEach((ref) {
      final Map<String, dynamic> user = ref.data();
      if (user.containsKey("availableEnd") && user.containsKey("name")
          && user.containsKey("email") && user.containsKey("availableStart")
          && user.containsKey("availableEnd")
          && user.containsKey("price") &&
          cast<DateTime>(user["availableEnd"]).compareTo(buyerEnd) >= 0) {
        Seller s = new Seller(user["name"].toString(), user["email"].toString(), cast<double>(user["price"].toString()),
          cast<DateTime>(user["availableStart"].toString()), cast<DateTime>(user["availableEnd"]), user["typeSell"].toString());
        sellers.add(s);
      }
    });
    return sellers;
    // print(ref);
    // fs.QuerySnapshot test = await store.collection('sellers').get();
    // test.exi
    // var toPrint = test.exists();
    // print("TEST*******");
    // print(toPrint);
  }
}

T cast<T>(x) => x is T ? x : null;
