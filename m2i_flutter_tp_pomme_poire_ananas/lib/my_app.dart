import 'package:flutter/material.dart';

import 'pomme_poire_ananas.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomme, Poire, Ananas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: const PommePoireAnanas(title: 'Pomme, Poire, Ananas'),
    );
  }
}