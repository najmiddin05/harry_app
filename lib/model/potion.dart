final potion = {
  "slug": "ageing-potion",
  "name": "Ageing Potion",
  "effect": "Aged drinker temporarily",
  "side_effects": null,
  "characteristics": "Green",
  "time": null,
  "difficulty": "Advanced",
  "ingredients": "Newt spleens, Bananas, An orange snake, A green leaf",
  "inventors": null,
  "manufacturers": null,
  "image":
      "https://static.wikia.nocookie.net/harrypotter/images/5/51/Ageing_Potion_PM.png",
  "wiki": "https://harrypotter.fandom.com/wiki/Ageing_Potion"
};

class Potion {
  String slug;
  String name;
  String? effect;
  String? sideEffects;
  String? characteristics;
  String? time;
  String? difficulty;
  String? ingredients;
  String? inventors;
  String? manufacturers;
  String? image;
  String wiki;
  Potion({
    required this.slug,
    required this.name,
    required this.effect,
    required this.sideEffects,
    required this.characteristics,
    required this.time,
    required this.difficulty,
    required this.ingredients,
    required this.inventors,
    required this.manufacturers,
    required this.image,
    required this.wiki,
  });

  factory Potion.fromJson(Map<String, Object?> json) {
    return Potion(
      slug: json["slug"] as String,
      name: json["name"] as String,
      effect: json["effect"] as String?,
      sideEffects: json["side_effects"] as String?,
      characteristics: json["characteristics"] as String?,
      time: json["time"] as String?,
      difficulty: json["difficulty"] as String?,
      ingredients: json["ingredients"] as String?,
      inventors: json["inventors"] as String?,
      manufacturers: json["manufacturers"] as String?,
      image: json["image"] as String?,
      wiki: json["wiki"] as String,
    );
  }
}
