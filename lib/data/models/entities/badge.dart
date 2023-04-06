class Badges {
  Badges({
    required this.id,
    required this.type,
    required this.data,
  });

  Badges.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    type = json['type'] as String;
    data = Data.fromJson(json['data'] as Map<String, dynamic>);
  }
  late final String id;
  late final String type;
  late final Data data;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['type'] = type;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.date,
    required this.period,
    required this.position,
  });

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'] as String;
    period = json['period'] as String;
    position = json['position'] as String;
  }
  late final String date;
  late final String period;
  late final String position;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date'] = date;
    data['period'] = period;
    data['position'] = position;
    return data;
  }
}
