import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../repositories/cryptoCoins/models/Coin.dart';

class CryptoCoinScreen extends StatefulWidget{
  const CryptoCoinScreen({super.key});


  @override
  State<StatefulWidget> createState() => _CryptoCoinScreen();
}

class _CryptoCoinScreen extends State<CryptoCoinScreen>{
  late Coin coin;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      log("Args is null");
      return;
    }
    if (args is! Coin) {
      log("Arguments is Coin");
    }
    coin = args as Coin;
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(coin.getName()),
        backgroundColor: Colors.lightGreen,
      ),
      
    );
  }

}