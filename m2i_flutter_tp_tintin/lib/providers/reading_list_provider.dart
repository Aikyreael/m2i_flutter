import 'package:flutter/cupertino.dart';

import '../models/album.dart';

class ReadingListProvider extends ChangeNotifier {
  final List<Album> _readingList = [];

  List<Album> get readingList =>  List.unmodifiable(_readingList);

  void add(Album album) {
    _readingList.add(album);
    notifyListeners();
  }

  void remove(Album album) {
    _readingList.remove(album);
    notifyListeners();
  }
}