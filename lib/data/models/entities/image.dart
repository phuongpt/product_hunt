class ImageUrl {
  ImageUrl({
    this.s50px,
    this.s88px,
    this.s176px,
    this.s88px2X,
    this.s88px3X,
    this.original,
  });

  ImageUrl.fromJson(Map<String, dynamic> json) {
    s50px = json['50px'] as String;
    s88px = json['88px'] as String;
    s176px = json['176px'] as String;
    s88px2X = json['88px@2X'] as String;
    s88px3X = json['88px@3X'] as String;
    original = json['original'] as String;
  }
  String? s50px;
  String? s88px;
  String? s176px;
  String? s88px2X;
  String? s88px3X;
  String? original;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['50px'] = s50px;
    data['88px'] = s88px;
    data['176px'] = s176px;
    data['88px@2X'] = s88px2X;
    data['88px@3X'] = s88px3X;
    data['original'] = original;
    return data;
  }
}

class Screenshots {
  Screenshots({this.s300px, this.s850px});

  Screenshots.fromJson(Map<String, dynamic> json) {
    s300px = json['300px'] as String;
    s850px = json['850px'] as String;
  }

  String? s300px;
  String? s850px;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['300px'] = s300px;
    data['850px'] = s850px;
    return data;
  }
}

class Thumbnail {
  Thumbnail({
    required this.id,
    required this.mediaType,
    required this.imageUrl,
  });

  Thumbnail.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    mediaType = json['media_type'] as String;
    imageUrl = json['image_url'] as String;
  }
  late final String id;
  late final String mediaType;
  late final String imageUrl;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['media_type'] = mediaType;
    data['image_url'] = imageUrl;
    return data;
  }
}
