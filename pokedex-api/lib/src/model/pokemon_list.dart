part of pokedex_api;

PokemonListModel pokemonlistFromJson(String str) => PokemonListModel.fromJson(json.decode(str));

class PokemonListModel {
  PokemonListModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  String? next;
  dynamic? previous;
  List<Pokemon>? results;

  factory PokemonListModel.fromJson(Map<String, dynamic> json) => PokemonListModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: Pokemon.listFromJson(json["results"]),
      );
}
