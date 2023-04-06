class User {
  User({
    this.headline,
    required this.id,
    required this.name,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    name = json['name'] as String;
    headline = json['headline'] as String?;
  }
  late final String? headline;
  late final String id;
  late final String name;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['headline'] = headline;
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
