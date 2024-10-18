import 'package:flutter/material.dart';

import '../models/album.dart';

class AlbumDetails extends StatefulWidget {
  const AlbumDetails({super.key, required this.album, required this.readingList, required this.onAdd, required this.onDelete});

  final Album album;
  final List<Album> readingList;
  final Function onAdd;
  final Function onDelete;

  @override
  State<AlbumDetails> createState() => _AlbumDetailsState();
}

class _AlbumDetailsState extends State<AlbumDetails> {

  FloatingActionButton buildButton() {
    if (widget.readingList.contains(widget.album)) {
      return FloatingActionButton.extended(
        onPressed: () {
          setState(() {widget.onDelete(widget.album);});
        },
        label: const Text('Retirer'),
        icon: const Icon(Icons.remove),
      );
    }
    return FloatingActionButton.extended(
      onPressed: () {
        setState(() {widget.onAdd(widget.album);});
      },
      label: const Text('Ajouter'),
      icon: const Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row( children: [
          Text(widget.album.title, style: const TextStyle(color: Colors.white)),
          if (widget.readingList.contains(widget.album))... [
            const Icon(Icons.grade_rounded, color: Colors.white),
          ]
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
      floatingActionButton: buildButton(),
    );
  }
}

