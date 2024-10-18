import 'package:flutter/material.dart';
import 'package:m2i_flutter_tp_tintin/models/album.dart';
import 'package:m2i_flutter_tp_tintin/widgets/album_preview.dart';

import '../services/album_service.dart';

class AlbumsScrollableList extends StatefulWidget {
  const AlbumsScrollableList({super.key, required this.readingList, required this.onAdd, required this.onDelete});

  final List<Album> readingList;
  final Function onAdd;
  final Function onDelete;

  @override
  State<AlbumsScrollableList> createState() => _AlbumsScrollableListState();
}

class _AlbumsScrollableListState extends State<AlbumsScrollableList> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AlbumService.fetchAlbums(),
        builder: (context, snapshot)  =>
        snapshot.hasData
            ? ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (BuildContext context, index) => Card(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: AlbumPreview(album: snapshot.data![index], readingList: widget.readingList, onAdd: widget.onAdd, onDelete: widget.onDelete),
          ),
        )
            : const Center(
          child: CircularProgressIndicator(),
        )
    );
  }
}
