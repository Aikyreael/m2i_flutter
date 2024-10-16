import 'package:flutter/material.dart';
import 'package:m2i_flutter_tp_casino/random_casino.dart';

class Casino extends StatefulWidget {
  const Casino({super.key, required this.title});

  final String title;

  @override
  State<Casino> createState() => _CasinoState();
}

class _CasinoState extends State<Casino> {
  RandomCasino randomCasino = RandomCasino();

  String? firstItem;
  String? secondItem;
  String? thirdItem;
  
  Text gameResult = const Text("");
  Color backgroundColor = const Color(0xffffffff);
  
  void _play() {
    setState(() {
      firstItem = randomCasino.getRandomItem();
      secondItem = randomCasino.getRandomItem();
      thirdItem = randomCasino.getRandomItem();
    });
    if (firstItem == "sept" && secondItem == "sept" && thirdItem == "sept") {
      gameResult = const Text(
        "Jackpot de sept",
        style: TextStyle(color: Colors.yellow));
      backgroundColor = const Color(0xfffff07c);
    } else if (firstItem == secondItem && firstItem == thirdItem) {
      gameResult = const Text(
        "Jackpot",
          style: TextStyle(color: Colors.green));
      backgroundColor = const Color(0xff9cfd7e);
    } else {
      gameResult = const Text(
          "You lost, try again !");
      backgroundColor = const Color(0xffffffff);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
              width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      if(firstItem != null)... [
                          Image(image: AssetImage('images-casino/$firstItem.png')),
                          Image(image: AssetImage('images-casino/$secondItem.png')),
                          Image(image: AssetImage('images-casino/$thirdItem.png')),
                      ]
                    ],
                  ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(firstItem != null)... [
                  gameResult
                  ],
                ],
              )
            ),
            IconButton(onPressed: _play, icon: const Icon(Icons.play_arrow))
          ],
        ),
      ),
    );
  }
}