import 'package:flutter/material.dart';

class Seller {
  String name;
  String email;
  DateTime availableStart;
  DateTime availableEnd;
  double price;
  String typeSell;
  Seller(String _name, String _email, double _price, DateTime _availableStart, DateTime _availableEnd, String _typeSell){
    name = name;
    email = email;
    price = price;
    availableStart = _availableStart;
    availableEnd = _availableEnd;
    typeSell = _typeSell;
  }
}