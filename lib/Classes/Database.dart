import 'package:DinexDaddy/Classes/Seller.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;

class DataBase{
  fs.Firestore store;
  DataBase() {
    store = firestore();
  }
  addSeller(Seller s){
    print(s);
    store.collection('sellers').add({
      "email": s.email,
      "name": s.name,
      "availableStart": s.availableStart,
      "availableEnd": s.availableEnd,
      "typeSell": s.typeSell,
      "price": s.price,
    });
  }
  getSellers(DateTime buyerStart, DateTime buyerEnd) async{
    fs.QuerySnapshot ref = await store.collection('sellers').where("availableStart", '>=', buyerStart).where("availableEnd", '<=', buyerEnd).get().then((querySnapshot){
      querySnapshot.forEach((documentSnapshot) {
      var data = documentSnapshot.data();
      print("Data is***");
      print(data);
      });
    });
    
    fs.QuerySnapshot test = await store.collection('sellers').get().then((querySnapshot){
      querySnapshot.forEach((documentSnapshot) {
      var data = documentSnapshot.data();
      print("All Data is***");
      print(data);
      });
    });

    // print("ref*******");
    // print(ref);
    // fs.QuerySnapshot test = await store.collection('sellers').get();
    // test.exi
    // var toPrint = test.exists();
    // print("TEST*******");
    // print(toPrint);
  }
}