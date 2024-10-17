import 'package:m2i_flutter_tp_tintin/models/gps.dart';

class Album {
   Album ({
    required this.title,
    required this.number,
    required this.year,
             this.yearInColor,
    required this.image,
    required this.resume,
    required this.gps,
    required this.location
  });

  final String title;
  final int number;
  final int year;
        int? yearInColor;
  final String image;
  final String resume;
  final Gps gps;
  final String location;

   @override
  String toString() {
    return 'Album{title: $title, number: $number, year: $year, yearInColor: $yearInColor, image: $image, resume: $resume, gps: $gps, location: $location}';
  }

   Map<String, dynamic> toJson() {
    return {
      'title': title,
      'number': number,
      'year': year,
      'yearInColor': yearInColor,
      'image': image,
      'resume': resume,
      'gps': gps,
      'location': location,
    };
  }

  factory Album.fromJson(Map<String, dynamic> map) {
     return Album(
       title: map['titre'] as String,
       number: map['numero'] as int,
       year: map['parution'] as int,
       yearInColor: map['parutionEnCouleur'] as int?,
       image: map['image'] as String,
       resume: map['resume'] as String,
       gps: Gps.fromJson(map['gps']),
       location: map['lieu'] as String,
    );
   }
}

