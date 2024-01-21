
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:start_app/CoinList.dart';

class MainPageApp extends StatefulWidget {
  const MainPageApp({super.key});



  @override
  State<MainPageApp> createState() => _MainPageAppState();
}

class _MainPageAppState extends State<MainPageApp> {
  CoinList coinList = CoinList();

  @override
  Widget build(BuildContext context) {
    coinList = randomList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text("Welcome in Start app"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        itemCount: coinList.size(),
        itemBuilder: (context, i) => ListTile(
          leading: SvgPicture.asset('Assets/svg/Bitcoin_svg.svg', height: 25, width: 25,),
          title: Text(coinList.getName(i)),
          subtitle: Text(coinList.getPrice(i).toString()),
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          onTap: () => Navigator.pushNamed(context, "/coin",
              arguments: coinList.getCoin(i)
          ),
        ),
        separatorBuilder: (context, i) => const Divider(),
      )
    );
  }

  CoinList randomList(){
    CoinList list = CoinList();
    list.addCoin('ewf', 30, Colors.grey);
    list.addCoin('weqve', 245235, Colors.green);
    list.addCoin("q3ihtbi43bg", 34524523325, Colors.blue);
    list.addCoin("qw", 21, Colors.teal);
    return list;
  }
}