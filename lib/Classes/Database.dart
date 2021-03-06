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
  addSeller(Seller s) async {
    fs.QuerySnapshot refs = await store.collection('sellers').where("email", "==", s.email).get();
    var o = {
      "email": s.email,
      "name": s.name,
      "availableStart": s.availableStart,
      "availableEnd": s.availableEnd,
      "typeSell": s.typeSell,
      "price": s.price,
      "location": s.location
    };
    if (refs.empty)
      store.collection('sellers').add(o);
    else {
      refs.forEach((user) {
        fs.DocumentReference doc = store.collection("sellers").doc(user.id);
        doc.update(data: o);
      });
    }
  }

  Future<List<Seller>> getSellers(DateTime buyerStart, DateTime buyerEnd, String typeSell, String location) async{
    // .where("availableEnd", '<=', buyerEnd)
    fs.QuerySnapshot refs = await store.collection('sellers').where("availableStart", '<=', buyerEnd).where("typeSell", "==", typeSell).get();
    List<Seller> sellers = [];
    refs.forEach((ref) {
      final Map<String, dynamic> user = ref.data();
      if (user.containsKey("availableEnd") && user.containsKey("name")
          && user.containsKey("email") && user.containsKey("availableStart")
          && user.containsKey("availableEnd")
          && user.containsKey("price") && user.containsKey("location") &&
          cast<DateTime>(user["availableEnd"]).compareTo(buyerStart) >= 0) {
        if (location == "(No Preference)" || user["location"].toString() == "(No Preference)" || user["location"].toString() == location) {
          Seller s = new Seller(user["name"].toString(), user["email"].toString(), cast<double>(user["price"]),
            cast<DateTime>(user["availableStart"]), cast<DateTime>(user["availableEnd"]), user["typeSell"].toString(),
            user["location"].toString());
          sellers.add(s);
        }
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
