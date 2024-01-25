import 'Coin.dart';
class CoinList{

  late List<Coin> _coinList = [];


  void addCoin(String name, double price, String imageUrl){
    _coinList.add(Coin(name, price, imageUrl));
  }

  String getName(int index){
    return _coinList[index].getName();
  }

  double getPrice(int index){
    return _coinList[index].getPrice();
  }

  int size(){
    return _coinList.length;
  }

  Coin getCoin(int index){
    return _coinList[index];
  }

  String getImageUrl(int index){
    return _coinList[index].getImageUrl();
  }
}
