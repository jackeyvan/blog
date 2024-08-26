import 'package:bolg_backend/db/hive_box.dart';
import 'package:hive/hive.dart';

part 'blog.g.dart';

@HiveType(typeId: 4)
class Blog {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  String category;
  @HiveField(3)
  List<String> tags;
  @HiveField(4)
  int publishDate;

  Blog({
    required this.title,
    required this.content,
    required this.category,
    required this.tags,
    required this.publishDate,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "content": content,
      "category": category,
      "tags": tags,
      "publishDate": publishDate,
    };
  }

  factory Blog.fromJson(dynamic json) {
    return Blog(
        title: json["title"],
        content: json["content"],
        category: json["category"],
        tags: (json["tags"] as List).map((e) => e as String).toList(),
        publishDate: json["publishDate"]);
  }

  void saveTagAndCategory() {
    HiveBox.blogCategoryBox.put(category, category);
    tags.forEach((value) {
      if (!HiveBox.blogCategoryBox.containsKey(value)) {
        HiveBox.blogCategoryBox.put(value, value);
      }
    });
  }
}
