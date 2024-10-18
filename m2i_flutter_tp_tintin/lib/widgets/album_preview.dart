import 'package:flutter/material.dart';
import 'package:m2i_flutter_tp_tintin/screens/album_details.dart';
import 'package:m2i_flutter_tp_tintin/services/album_service.dart';
import 'package:provider/provider.dart';

import '../models/album.dart';
import '../providers/reading_list_provider.dart';

class AlbumPreview extends StatefulWidget {
  const AlbumPreview({super.key, required this.album});

  final Album album;

  @override
  State<AlbumPreview> createState() => _AlbumPreviewState();
}

class _AlbumPreviewState extends State<AlbumPreview> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.all(8),
        tileColor: const Color(0xFF243A39),
        title: Row(
          children: [
            Text(widget.album.title,
                style: const TextStyle(color: Colors.white)),
            Consumer<ReadingListProvider>(
              builder: (BuildContext context, ReadingListProvider value,
                  Widget? child) {
                if (value.readingList.contains(widget.album)) {
                  return const Icon(Icons.grade_rounded, color: Colors.white);
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
        subtitle: Text("${widget.album.resume.substring(0, 67)}...",
            style: const TextStyle(color: Color(0x5CFFFFFF))),
        leading: widget.album.image != ""
            ? Image(
                image: AssetImage('images/${widget.album.image}'),
                height: 40,
                width: 40)
            : const Icon(Icons.image, color: Colors.white),
        trailing: IconButton(
          icon: const Icon(Icons.info),
          color: Colors.white,
          onPressed: () {
            AlbumService.fetchAlbums();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AlbumDetails(album: widget.album)),
            );
          },
        ));
  }
}
