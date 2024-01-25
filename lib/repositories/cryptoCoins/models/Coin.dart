class Coin{
  late String _name;
  late double _priceInUSD;
  late String _imageUrl;

  Coin(String name, double priceInUSD, String imageUrl){
    _name = name;
    _priceInUSD = priceInUSD;
    _imageUrl = imageUrl;
  }

  String getName(){
    return _name;
  }

  double getPrice(){
    return _priceInUSD;
  }

  String getImageUrl(){
    return _imageUrl;
  }

}