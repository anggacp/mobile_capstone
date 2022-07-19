class Album {
  final int idRs;

  const Album({
    required this.idRs,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      idRs: json['title'],
    );
  }
}