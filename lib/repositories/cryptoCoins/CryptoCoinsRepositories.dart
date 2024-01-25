import 'package:start_app/repositories/cryptoCoins/models/CoinList.dart';
import 'package:flutter/material.dart';

import '../../dio.dart';
class CryptoCoinRepositories{
  Future<CoinList> getCoinList() async{
    final response = await dio.get(
        "data/pricemultifull?fsyms=BTC,REP,BNB,ETH&tsyms=USD,EUR"
    );
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data["RAW"] as Map<String, dynamic>;
    debugPrint(response.toString());
    CoinList _coinList = CoinList();
    final _coinArray = dataRaw.entries.forEach((e){
      final usdData = (e.value as Map<String, dynamic>)["USD"] as Map<String, dynamic>;
      final price = usdData["PRICE"];
      final imageUrl = usdData["IMAGEURL"];
      _coinList.addCoin(
          e.key,
          price,
          "https://www.cryptocompare.com/$imageUrl"
      );
    }
    );
    return _coinList;
  }


}