final spell = {
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
};

class Spell {
  String slug;
  String name;
  String? incantation;
  String category;
  String effect;
  String? light;
  String? hand;
  String? creator;
  String? image;
  String wiki;

  Spell({
    required this.slug,
    required this.name,
    required this.incantation,
    required this.category,
    required this.effect,
    required this.light,
    required this.hand,
    required this.creator,
    required this.image,
    required this.wiki,
  });

  factory Spell.fromJson(Map<String, Object?> json) {
    return Spell(
      slug: json["slug"] as String,
      name: json["name"] as String,
      incantation: json["incantation"] as String?,
      category: json["category"] as String,
      effect: json["effect"] as String,
      light: json["light"] as String?,
      hand: json["hand"] as String?,
      creator: json["creator"] as String?,
      image: json["image"] as String?,
      wiki: json["wiki"] as String,
    );
  }
}
