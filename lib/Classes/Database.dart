import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;

class DataBase{
  fs.Firestore store;
  DataBase() {
    store = firestore();
  }
  addSeller(String email, String name, DateTime availableStart,
            DateTime availableEnd, String typeSell){
    store.collection('sellers').add({
      "email": email,
      "name": name,
      "availableStart": availableStart,
      "availableEnd": availableEnd,
      "typeSell": typeSell
    });
  }

}