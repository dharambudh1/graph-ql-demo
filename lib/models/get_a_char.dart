class GetAChar {
  GetAChar({this.sTypename, this.character});

  GetAChar.fromJson(Map<String, dynamic> json) {
    sTypename = json["__typename"];
    character = json["character"] != null
        ? Character.fromJson(json["character"])
        : null;
  }
  String? sTypename;
  Character? character;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["__typename"] = sTypename;
    if (character != null) {
      data["character"] = character!.toJson();
    }
    return data;
  }
}

class Character {
  Character({
    this.sTypename,
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
    this.created,
  });

  Character.fromJson(Map<String, dynamic> json) {
    sTypename = json["__typename"];
    id = json["id"];
    name = json["name"];
    status = json["status"];
    species = json["species"];
    type = json["type"];
    gender = json["gender"];
    image = json["image"];
    created = json["created"];
  }
  String? sTypename;
  String? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  String? image;
  String? created;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["__typename"] = sTypename;
    data["id"] = id;
    data["name"] = name;
    data["status"] = status;
    data["species"] = species;
    data["type"] = type;
    data["gender"] = gender;
    data["image"] = image;
    data["created"] = created;
    return data;
  }
}
