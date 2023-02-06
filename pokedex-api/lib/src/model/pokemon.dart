part of pokedex_api;

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

class Pokemon {
  Pokemon({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        url: json["url"],
      );
  static List<Pokemon> listFromJson(List<dynamic> listJson) {
    return listJson.map((e) => Pokemon.fromJson(e)).toList();
  }
}
