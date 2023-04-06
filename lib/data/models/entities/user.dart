class User {
  User({
    required this.id,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json?['id'] as String? ?? "";
  }
  late final String id;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}
