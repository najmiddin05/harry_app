import 'package:harry_app/model/chapter/chapter.dart';
import 'package:harry_app/model/api_response/chapters_relationships.dart';
import 'package:harry_app/model/character.dart';
import 'package:harry_app/model/movie.dart';
import 'package:harry_app/model/potion.dart';
import 'package:harry_app/model/spell.dart';

import 'book.dart';

final data = {
  "id": "94128c2f-4180-4daf-81b4-9b96494caa75",
  "type": "spell",
  "attributes": {
    "slug": "age-line",
    "name": "Age Line",
    "incantation": null,
    "category": "Charm",
    "effect":
        "Prevents people above or below a certain age from access to a target",
    "light": "Blue",
    "hand": null,
    "creator": null,
    "image":
        "https://static.wikia.nocookie.net/harrypotter/images/e/e5/Age_Line_surrounding_the_Goblet_of_Fire_PM.jpg",
    "wiki": "https://harrypotter.fandom.com/wiki/Age_Line"
  }
};

class Data<T> {
  String id;
  String type;
  T attributes;
  ChapterRelationships? relationships;

  Data({
    required this.id,
    required this.type,
    required this.attributes,
    required this.relationships,
    // required this.data,
  });

  factory Data.fromJson(Map<String, Object?> json) {
    String id = json["id"] as String;
    String type = json["type"] as String;
    T attributes;
    ChapterRelationships? relationships = json["relationships"] != null
        ? ChapterRelationships.fromJson(
            json["relationships"] as Map<String, dynamic>)
        : null;
    
    switch (T) {
      case Book:
        attributes =
            Book.fromJson(json["attributes"] as Map<String, dynamic>) as T;
        break;
      case Character:
        attributes =
            Character.fromJson(json["attributes"] as Map<String, dynamic>) as T;
        break;
      case Chapter:
        attributes =
            Chapter.fromJson(json["attributes"] as Map<String, dynamic>) as T;
      case Movie:
        attributes =
            Movie.fromJson(json["attributes"] as Map<String, dynamic>) as T;
        break;
      case Potion:
        attributes =
            Potion.fromJson(json["attributes"] as Map<String, dynamic>) as T;

      default:
        attributes =
            Spell.fromJson(json["attributes"] as Map<String, dynamic>) as T;
    }

    return Data(
      relationships: relationships,
      id: id,
      type: type,
      attributes: attributes,
      // data: relation,
    );
  }
}
