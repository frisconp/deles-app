class Article {
  int id;
  String title;
  String content;
  String thumbnail;
  String adminId;
  String createdAt;
  String updatedAt;

  Article({
    this.id,
    this.title,
    this.content,
    this.thumbnail,
    this.adminId,
    this.createdAt,
    this.updatedAt,
  });

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    thumbnail = json['thumbnail'];
    adminId = json['admin_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['thumbnail'] = this.thumbnail;
    data['admin_id'] = this.adminId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
