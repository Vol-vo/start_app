class Coin{
  late String _name;
  late double _priceInUSD;

  Coin(String name, double priceInUSD){
    _name = name;
    _priceInUSD = priceInUSD;
  }

  String getName(){
    return _name;
  }

  double getPrice(){
    return _priceInUSD;
  }

}