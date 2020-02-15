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
    store.collection('sellers').add({
      "email": s.email,
      "name": s.name,
      "availableStart": s.availableStart,
      "availableEnd": s.availableEnd,
      "typeSell": s.typeSell,
      "price": s.price
    });
  }

}