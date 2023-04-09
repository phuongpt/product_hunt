class InstallLinks {
  InstallLinks.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    postId = json['post_id'] as String;
    createdAt = json['created_at'] as String;
    primaryLink = json['primary_link'] as bool;
    websiteName = json['website_name'] as String;
    redirectUrl = json['redirect_url'] as String;
  }
  late final String id;
  late final String postId;
  late final String createdAt;
  late final bool primaryLink;
  late final String websiteName;
  late final String redirectUrl;
}
