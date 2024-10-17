import 'package:flutter/material.dart';
import 'package:m2i_flutter_tp_tintin/widgets/albums_scrollable_list.dart';

class AlbumsMaster extends StatefulWidget {
  const AlbumsMaster({super.key, required this.title});

  final String title;

  @override
  State<AlbumsMaster> createState() => _AlbumsMasterState();
}

class _AlbumsMasterState extends State<AlbumsMaster> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: const AlbumsScrollableList(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: ,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }


}

