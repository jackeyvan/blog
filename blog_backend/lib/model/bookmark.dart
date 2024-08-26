import 'package:hive/hive.dart';

part 'bookmark.g.dart';

@HiveType(typeId: 2)
class BookmarkType {
  @HiveField(0)
  String name;
  @HiveField(1)
  int id;

  BookmarkType({required this.name, required this.id});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "id": id,
    };
  }
}

@HiveType(typeId: 3)
class Bookmark {
  @HiveField(0)
  String name;
  @HiveField(1)
  String link;
  @HiveField(2)
  String? logo;
  @HiveField(3)
  String? desc;
  @HiveField(4)
  int id;

  Bookmark({
    required this.name,
    required this.link,
    required this.id,
    this.logo,
    this.desc,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "id": id,
      "link": link,
      "desc": desc,
      "logo": logo,
    };
  }

  factory Bookmark.fromJson(dynamic json) {
    return Bookmark(
        name: json["name"],
        link: json["link"],
        id: json["id"],
        logo: json["logo"],
        desc: json["desc"]);
  }
}
