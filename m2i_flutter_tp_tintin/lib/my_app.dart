import 'package:flutter/material.dart';
import 'package:m2i_flutter_tp_tintin/screens/albums_master.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Albums library',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1F2F2E),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const AlbumsMaster(title: 'Albums'),
    );
  }
}