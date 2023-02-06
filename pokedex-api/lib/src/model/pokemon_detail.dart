part of pokedex_api;

PokemonDetail pokemonDetailFromJson(String str) => PokemonDetail.fromJson(json.decode(str));

class PokemonDetail {
  PokemonDetail({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.height,
    this.id,
    this.isDefault,
    this.moves,
    this.name,
    this.order,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  List<Ability>? abilities;
  int? baseExperience;
  List<Species>? forms;
  int? height;
  int? id;
  bool? isDefault;
  List<Move>? moves;
  String? name;
  int? order;
  Species? species;
  Sprites? sprites;
  List<Stat>? stats;
  List<Type>? types;
  int? weight;

  factory PokemonDetail.fromJson(Map<String, dynamic> json) => PokemonDetail(
        abilities: Ability.listFromJson(json["abilities"]),
        baseExperience: json["base_experience"],
        forms: Species.listFromJson(json["forms"]),
        height: json["height"],
        id: json["id"],
        isDefault: json["is_default"],
        moves: Move.listFromJson(json["moves"]),
        name: json["name"],
        order: json["order"],
        species: Species.fromJson(json["species"]),
        sprites: Sprites.fromJson(json["sprites"]),
        stats: Stat.listFromJson(json["stats"]),
        types: Type.listFromJson(json["types"]),
        weight: json["weight"],
      );
}

class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  Species? ability;
  bool? isHidden;
  int? slot;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  static List<Ability> listFromJson(List<dynamic> listJson) {
    return listJson.map((e) => Ability.fromJson(e)).toList();
  }
}

class Species {
  Species({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );
  static List<Species> listFromJson(List<dynamic> listJson) {
    return listJson.map((e) => Species.fromJson(e)).toList();
  }
}

class Move {
  Move({
    this.move,
    this.versionGroupDetails,
  });

  Species? move;
  List<VersionGroupDetail>? versionGroupDetails;

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Species.fromJson(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(json["version_group_details"].map((x) => VersionGroupDetail.fromJson(x))),
      );

  static List<Move> listFromJson(List<dynamic> listJson) {
    return listJson.map((e) => Move.fromJson(e)).toList();
  }
}

class VersionGroupDetail {
  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  int? levelLearnedAt;
  Species? moveLearnMethod;
  Species? versionGroup;

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) => VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: Species.fromJson(json["move_learn_method"]),
        versionGroup: Species.fromJson(json["version_group"]),
      );

  static List<VersionGroupDetail> listFromJson(List<dynamic> listJson) {
    return listJson.map((e) => VersionGroupDetail.fromJson(e)).toList();
  }
}

class Sprites {
  Sprites({this.backDefault, this.backFemale, this.backShiny, this.backShinyFemale, this.frontDefault, this.frontFemale, this.frontShiny, this.frontShinyFemale});

  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;
  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );
}

class Stat {
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  int? baseStat;
  int? effort;
  Species? stat;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
      );

  static List<Stat> listFromJson(List<dynamic> listJson) {
    return listJson.map((e) => Stat.fromJson(e)).toList();
  }
}

class Type {
  Type({
    this.slot,
    this.type,
  });

  int? slot;
  Species? type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
      );
  static List<Type> listFromJson(List<dynamic> listJson) {
    return listJson.map((e) => Type.fromJson(e)).toList();
  }
}
