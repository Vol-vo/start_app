import 'package:dio/dio.dart';
import 'package:start_app/repositories/cryptoCoins/models/CoinList.dart';
import 'package:flutter/material.dart';
class CryptoCoinRepositories{
  Future<CoinList> getCoinList() async{
    final response = await Dio().get(
        "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH&tsyms=USD,EUR"
    );
    final data = response.data() as Map<String, dynamic>;
    debugPrint(response.toString());
    CoinList _coinList = CoinList();
    final _coinArray = data.entries.map((e) =>
        _coinList.addCoin(
            e.key,
            (e.value as Map<String, dynamic>)["USD"])
    );
    return _coinList;
  }
}