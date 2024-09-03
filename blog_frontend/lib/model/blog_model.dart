class BlogModel {
  BlogModel({
    this.title,
    this.content,
    this.category,
    this.tags,
    this.publishDate,
    this.id,
    this.published,
  });

  BlogModel.fromJson(dynamic json) {
    title = json['title'];
    content = json['content'];
    category = json['category'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    publishDate = json['publishDate'];
    id = json['id'];
    published = json['published'];
  }

  String? title;
  String? content;
  String? category;
  List<String>? tags;
  int? publishDate;
  int? id;
  int? published;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['content'] = content;
    map['category'] = category;
    map['tags'] = tags;
    map['publishDate'] = publishDate;
    map['id'] = id;
    map['published'] = published;
    return map;
  }
}
