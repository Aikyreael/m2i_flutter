import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int _result = 2;
  int _counter = 0;
  int _increment = 2;
  int _clickCount = 0;

  final myController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _result += _increment;
      _counter = _result - _increment;
      _clickCount++;
    });
  }

  void _resetCounter() {
    setState(() {
      _result = 2;
      _counter = 0;
      _increment = 2;
      _clickCount = 0;
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    myController.addListener(_changeLatestValue);
  }

  void _changeLatestValue() {
    _increment = int.parse(myController.text);
    _result = _counter + _increment;
    setState(() {
      if (_increment == 0) {
        _increment = 2;
        _showAlert();
      }
    });
  }

  Future<void> _showAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erreur'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "La valeur de l'incrément doit être supérieure à 0",
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                setState(() {
                  _increment = 2;
                });
                myController.text = "2";
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if( _clickCount > 0)... [
              Text('Vous avez cliqué $_clickCount fois'),
            ],
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(labelText: "Incrément (= $_increment)"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: myController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$_counter + $_increment =',
                ),
                Text(
                  ' $_result',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
              ),
                onPressed: _resetCounter,
                child: const Text('Reset')
            )
          ],
        ),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Text('+$_increment'),
      ),
    );
  }
}

