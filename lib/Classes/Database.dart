import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;

class DataBase{
  fs.Firestore store;
  DataBase() {
    store = firestore();
  }
  add(){
    store.collection('messages').add({
                        'text': "TEST WEB MESSAGE",
                        'value': 2,
                      });
  }

}