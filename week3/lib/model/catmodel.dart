class CatModel {
  final String breed;
  final String country;
  final String origin;
  final String coat;
  final String pattern;

  CatModel(
      {required this.breed,
      required this.country,
      required this.origin,
      required this.coat,
      required this.pattern});

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      breed: json['breed'],
      country: json['country'],
      origin: json['origin'],
      coat: json['coat'],
      pattern: json['pattern'],
    );
  }
}
