import 'dart:ui';
import 'package:flutter/material.dart';
class Coin{
  late String _name;
  late double _price;
  late Color _color;

  Coin(String name, double price, Color color){
    _name = name;
    _price = price;
    _color = color;
  }

  String getName(){
    return _name;
  }

  double getPrice(){
    return _price;
  }

  Color getColor(){
    return _color;
  }


}