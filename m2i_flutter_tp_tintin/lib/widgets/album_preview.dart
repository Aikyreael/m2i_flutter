import 'package:flutter/material.dart';
import 'package:m2i_flutter_tp_tintin/screens/album_details.dart';
import 'package:m2i_flutter_tp_tintin/services/album_service.dart';

import '../models/album.dart';

class AlbumPreview extends StatefulWidget {
  const AlbumPreview({super.key, required this.album, required this.readingList, required this.onAdd, required this.onDelete});

  final Album album;
  final List<Album> readingList;
  final Function onAdd;
  final Function onDelete;

  @override
  State<AlbumPreview> createState() => _AlbumPreviewState();
}

class _AlbumPreviewState extends State<AlbumPreview> {



  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      tileColor: const Color(0xFF243A39),
      title: Row(
        children: [
          Text(widget.album.title,
              style: const TextStyle(color: Colors.white)),
          if (widget.readingList.contains(widget.album))... [
            const Icon(Icons.grade_rounded, color: Colors.white),
          ]
        ],
      ),
      leading: widget.album.image != ""
          ? Image(image: AssetImage('images/${widget.album.image}'), height: 40, width: 40)
          : const Icon(Icons.image, color: Colors.white),
      trailing: IconButton(icon: const Icon(Icons.info), color: Colors.white,
        onPressed: () {
        AlbumService.fetchAlbums();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AlbumDetails(album: widget.album, readingList: widget.readingList, onAdd: widget.onAdd, onDelete: widget.onDelete)),
          );
        },
      )
    );
  }
}
