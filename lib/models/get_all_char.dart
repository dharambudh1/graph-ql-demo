class GetAllChar {
  GetAllChar({this.sTypename, this.characters});

  GetAllChar.fromJson(Map<String, dynamic> json) {
    sTypename = json["__typename"];
    characters = json["characters"] != null
        ? Characters.fromJson(json["characters"])
        : null;
  }
  String? sTypename;
  Characters? characters;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["__typename"] = sTypename;
    if (characters != null) {
      data["characters"] = characters!.toJson();
    }
    return data;
  }
}

class Characters {
  Characters({this.sTypename, this.info, this.results});

  Characters.fromJson(Map<String, dynamic> json) {
    sTypename = json["__typename"];
    info = json["info"] != null ? Info.fromJson(json["info"]) : null;
    if (json["results"] != null) {
      results = <Results>[];
      for (final dynamic v in json["results"] as List<dynamic>) {
        results?.add(Results.fromJson(v));
      }
    }
  }
  String? sTypename;
  Info? info;
  List<Results>? results;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["__typename"] = sTypename;
    if (info != null) {
      data["info"] = info!.toJson();
    }
    if (results != null) {
      data["results"] = results!.map((Results v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  Info({this.sTypename, this.count, this.pages, this.next, this.prev});

  Info.fromJson(Map<String, dynamic> json) {
    sTypename = json["__typename"];
    count = json["count"];
    pages = json["pages"];
    next = json["next"];
    prev = json["prev"];
  }
  String? sTypename;
  int? count;
  int? pages;
  int? next;
  int? prev;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["__typename"] = sTypename;
    data["count"] = count;
    data["pages"] = pages;
    data["next"] = next;
    data["prev"] = prev;
    return data;
  }
}

class Results {
  Results({this.sTypename, this.id, this.name, this.image});

  Results.fromJson(Map<String, dynamic> json) {
    sTypename = json["__typename"];
    id = json["id"];
    name = json["name"];
    image = json["image"];
  }
  String? sTypename;
  String? id;
  String? name;
  String? image;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["__typename"] = sTypename;
    data["id"] = id;
    data["name"] = name;
    data["image"] = image;
    return data;
  }
}
