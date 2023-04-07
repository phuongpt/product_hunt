class User {
  User({
    required this.id,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json?['id'] as String? ?? "";
  }
  late final String id;
}
