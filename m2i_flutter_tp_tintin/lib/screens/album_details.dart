import 'package:flutter/material.dart';
import 'package:m2i_flutter_tp_tintin/widgets/album_details_button.dart';
import 'package:provider/provider.dart';

import '../models/album.dart';
import '../providers/reading_list_provider.dart';

class AlbumDetails extends StatefulWidget {
  const AlbumDetails({super.key, required this.album});

  final Album album;

  @override
  State<AlbumDetails> createState() => _AlbumDetailsState();
}

class _AlbumDetailsState extends State<AlbumDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row( children: [
          Text(widget.album.title, style: const TextStyle(color: Colors.white)),
          Consumer<ReadingListProvider>(
            builder: (BuildContext context, ReadingListProvider value, Widget? child)
            {
              if (value.readingList.contains(widget.album)) {
                return const Icon(Icons.grade_rounded, color: Colors.white);
              }
              return const SizedBox.shrink();
            },
          )
        ],),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(widget.album.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35,horizontal: 20),
                  child: Text(widget.album.resume,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white)),
                ),
                 Text("Année de parution: ${widget.album.year}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white)),
                 Text("Numero: ${widget.album.number}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white)),
                widget.album.image != ""
                    ? Image(image: AssetImage('images/${widget.album.image}'), width: 300, height: 300,)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: AlbumDetailsButton(album: widget.album),
    );
  }
}

