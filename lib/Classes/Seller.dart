import 'package:flutter/material.dart';

class Seller {
  String name;
  String email;
  int dinexPrice;
  int blockPrice;
  Seller(String name, String email, int dinex, int block){
    name = name;
    email = email;
    dinexPrice = dinex;
    blockPrice = block;
  }
}