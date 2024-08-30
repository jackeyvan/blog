import 'package:bolg_backend/db/hive_box.dart';
import 'package:hive/hive.dart';

part 'blog.g.dart';

@HiveType(typeId: 4)
class Blog {
  @HiveField(0)
  String title;
  @HiveField(1)
  String? content;
  @HiveField(2)
  String category;
  @HiveField(3)
  List<String> tags;
  @HiveField(4)
  int? publishDate;
  @HiveField(5)
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
      content: json["content"] as String?,
      publishDate: json["publishDate"] as int?,
      id: json["id"] as int?,
      category: json["category"],
      tags: (json["tags"] as List).map((e) => e as String).toList(),
    );
  }

  Future<Blog> save() async {
    HiveBox.blogCategoryBox.put(category, category);

    tags.forEach((value) {
      if (!HiveBox.blogCategoryBox.containsKey(value)) {
        HiveBox.blogCategoryBox.put(value, value);
      }
    });

    if (content == null) {
      content = title;
    }

    if (publishDate == null) {
      publishDate = DateTime.now().millisecondsSinceEpoch;
    }

    if (id == null) {
      id = await HiveBox.blogBox.add(this);
    }
    await HiveBox.blogBox.put(id, this);

    return this;
  }
}
