class Album {
  final int id;
  final String email;
  final String name;
  final String gender;
  final String status;

  const Album({
    required this.id,
    required this.email,
    required this.name,
    required this.gender,
    required this.status,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      gender: json['gender'],
      status: json['status'],
    );
  }
}