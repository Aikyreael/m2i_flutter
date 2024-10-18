import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/album.dart';
import '../providers/reading_list_provider.dart';

class AlbumDetailsButton extends StatefulWidget {
  const AlbumDetailsButton({super.key, required this.album});

  final Album album;

  @override
  State<AlbumDetailsButton> createState() => _AlbumDetailsButtonState();
}

class _AlbumDetailsButtonState extends State<AlbumDetailsButton> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ReadingListProvider>(
      builder: (BuildContext context, ReadingListProvider value, Widget? child)
      {
        if (value.readingList.contains(widget.album)) {
          return FloatingActionButton.extended(
            onPressed: () {
              setState(() {value.remove(widget.album);});
            },
            label: const Text('Retirer'),
            icon: const Icon(Icons.remove),
          );
        }
        return FloatingActionButton.extended(
          onPressed: () {
            setState(() {value.add(widget.album);});
          },
          label: const Text('Ajouter'),
          icon: const Icon(Icons.add),
        );
      },
    );
  }
}
