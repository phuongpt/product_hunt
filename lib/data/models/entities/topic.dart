class Topic {
  Topic({
    required this.id,
    required this.name,
    required this.slug,
  });

  Topic.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    name = json['name'] as String;
    slug = json['slug'] as String;
  }
  late final String id;
  late final String name;
  late final String slug;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;

    return data;
  }
}
