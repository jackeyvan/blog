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
  int? publishDate;
  int? id;

  Blog({
    required this.title,
    required this.content,
    required this.category,
    required this.tags,
    this.publishDate,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "content": content,
      "category": category,
      "tags": tags,
      "id": id,
      "publishDate": publishDate,
    };
  }

  factory Blog.fromJson(dynamic json) {
    return Blog(
      title: json["title"],
      content: json["content"],
      category: json["category"],
      tags: (json["tags"] as List).map((e) => e as String).toList(),
    );
  }

  Future<int> save() {
    HiveBox.blogCategoryBox.put(category, category);

    tags.forEach((value) {
      if (!HiveBox.blogCategoryBox.containsKey(value)) {
        HiveBox.blogCategoryBox.put(value, value);
      }
    });

    if (content.isEmpty) {
      content = title;
    }
    publishDate = DateTime.now().millisecondsSinceEpoch;

    return HiveBox.blogBox.add(this);
  }
}
