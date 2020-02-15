import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase{
  final firestore = Firestore.instance;
  add(){
    firestore.collection('messages').add({
                        'text': "TEST WEB MESSAGE",
                        'value': 2,
                      });
  }

}