import 'package:flutter/material.dart';
import 'package:is_prime_number/is_prime_number.dart';

class PommePoireAnanas extends StatefulWidget {
  const PommePoireAnanas({super.key, required this.title});

  final String title;

  @override
  State<PommePoireAnanas> createState() => _PommePoireAnanasState();
}

class _PommePoireAnanasState extends State<PommePoireAnanas> {
  int _counter = 0;
  final List<int> _fruits = [];

  void _incrementCounter() {
    setState(() {
      _fruits.add(++_counter);
    });
  }

  ListTile fruitBuilder(int index) {
    return ListTile(
      onTap: () {
        setState(() {
            _showAlert(
                index,
                appBarTitle(index + 1),
                index % 2 == 0 ? Colors.cyan : Colors.lightBlueAccent,
                imageBuilder(index + 1)
            );
          }
        );
        },
      title: Text(_fruits[index].toString(), style: const TextStyle(color: Colors.white)),
      leading: imageBuilder(index + 1),
      tileColor: index % 2 == 0 ? Colors.cyan : Colors.lightBlueAccent,
    );
}

  Image imageBuilder(int index) {
    if ( isPrime(_fruits[index - 1]) ) {
      return const Image(image: AssetImage('images/ananas.png'), height: 50, width: 50,);
    } else if ( _fruits[index - 1] % 2 == 0 ) {
      return const Image(image: AssetImage('images/poire.png'), height: 50, width: 50,);
    } else {
      return const Image(image: AssetImage('images/pomme.png'), height: 50, width: 50,);
    }
  }

  FloatingActionButton buttonBuilder() {
    Color backgroundColor = Colors.orange;
    if ( _counter % 2 == 0 && _counter > 0) {
      backgroundColor = Colors.cyan;
    } else if ( _counter % 2 != 0) {
      backgroundColor = Colors.lightBlueAccent;
    }
    return FloatingActionButton(
      backgroundColor: backgroundColor,
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  String appBarTitle(int counter) {
    String title = "";
    if ( counter % 2 == 0 && counter > 0 ) {
      title += "Pair";
    } else if ( counter % 2 != 0 ){
      title += "Impair";
    }
    if (isPrime(counter)) {
      title += " et nombre premier";
    }
     return title;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("$_counter : ${appBarTitle(_counter)}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _fruits.length,
                    itemBuilder: (BuildContext context, int index) {
                      return fruitBuilder(index);
                    }
                ),
              )
          ],
        ),
      ),
      floatingActionButton: buttonBuilder()
    );
  }


  Future<void> _showAlert(int index, String title, Color color, Image image) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          backgroundColor: color,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                image,
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('supprimer'),
              onPressed: () {
                setState(() {
                  _fruits.removeWhere((fruit) => fruit == _fruits[index]);
                  Navigator.of(context).pop();
                });
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
