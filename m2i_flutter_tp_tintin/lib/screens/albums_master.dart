import 'package:flutter/material.dart';
import 'package:m2i_flutter_tp_tintin/widgets/albums_scrollable_list.dart';

class AlbumsMaster extends StatelessWidget {
  const AlbumsMaster({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(title, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: const AlbumsScrollableList(),
    );
  }
}




