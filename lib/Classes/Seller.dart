import 'package:flutter/material.dart';

class Seller {
  String name;
  String email;
  DateTime availableStart;
  DateTime availableEnd;
  double price;
  String typeSell;
  String location;
  Seller(this.name, this.email, this.price, this.availableStart, this.availableEnd, this.typeSell, this.location);
}