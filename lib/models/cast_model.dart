import 'dart:convert';


class CastModel {
  final String name;
  final String image;
  final String character;
  
  CastModel({
    required this.name,
    required this.image,
    required this.character,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'character': character,
    };
  }

  factory CastModel.fromMap(Map<String, dynamic> map) {
    String imageCast = map['profile_path'] != null ? 'https://image.tmdb.org/t/p/w200${map['profile_path']}' : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
    return CastModel(
      name: map['original_name'] ?? '',
      image: imageCast,
      character: map['character'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CastModel.fromJson(String source) => CastModel.fromMap(json.decode(source));
}
