class Commune {
  int wilayaId;
  int id;
  String name;

  Commune({required this.wilayaId, required this.id, required this.name});

  factory Commune.fromJson(Map<String, dynamic> json) {
    return Commune(
      wilayaId: json['wilaya_id'],
      id: json['id'],
      name: json['name'],
    );
  }
}
