import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:start_app/repositories/cryptoCoins/models/CoinList.dart';
import 'package:start_app/repositories/cryptoCoins/CryptoCoinsRepositories.dart';

class MainPageApp extends StatefulWidget {
  const MainPageApp({super.key});



  @override
  State<MainPageApp> createState() => _MainPageAppState();
}

class _MainPageAppState extends State<MainPageApp> {
  CoinList _coinList = CoinList();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text("Welcome in Start app"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
            itemCount: _coinList.size(),
            itemBuilder: (context, i) => ListTile(
              leading: SvgPicture.asset('Assets/svg/Bitcoin_svg.svg', height: 25, width: 25,),
              title: Text(_coinList.getName(i)),
              subtitle: Text(_coinList.getPrice(i).toString()),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              onTap: () => Navigator.pushNamed(context, "/coin",
                  arguments: _coinList.getCoin(i)
              ),
            ),
            separatorBuilder: (context, i) => const Divider(),

          ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download_for_offline),
        onPressed: () async {
          _coinList = await CryptoCoinRepositories().getCoinList();
          setState(() {});
        },
      ),
    );
  }

}