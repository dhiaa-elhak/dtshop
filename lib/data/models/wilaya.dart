class Wilaya {
  int id;
  String name;

  Wilaya({required this.id, required this.name});

  factory Wilaya.fromJson(Map<String, dynamic> json) {
    return Wilaya(
      id: json['id'],
      name: json['name'],
    );
  }
}
