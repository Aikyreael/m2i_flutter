import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter/services.dart';
import 'package:m2i_flutter_tp_tintin/models/album.dart';
import 'package:m2i_flutter_tp_tintin/models/gps.dart';

class AlbumService {

  static Future<List<Album>> generateAlbums() async {
    return List.generate(20, (i) =>
        Album(title: faker.conference.name(),
            number: random.integer(99),
            year: random.integer(2024, min: 1900),
            yearInColor: random.integer(255),
            image: "",
            resume: faker.lorem.sentence(),
            gps: Gps(longitude: faker.geo.longitude(), latitude: faker.geo.latitude()),
            location: faker.address.country())
    );
  }

  static Future<List<Album>?> fetchAlbums() async {
    final String jsonString = await rootBundle.loadString('data/albums.json');
    final data = jsonDecode(jsonString) as List;

    return data.map((album) => Album.fromJson(album as Map<String, dynamic>)).toList();
  }
}