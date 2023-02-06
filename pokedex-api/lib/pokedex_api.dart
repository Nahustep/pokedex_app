/// Support for doing something awesome.
///
/// More dartdocs go here.
library pokedex_api;

import 'dart:convert';
import 'package:dio/dio.dart';

part 'src/pokedex_error.dart';
part 'src/pokedex_api_client.dart';
part 'src/model/pokemon.dart';
part 'src/api/pokemon_api.dart';
part 'src/model/pokemon_detail.dart';
part 'src/model/pokemon_list.dart';

PokedexApiClient defaultApiClient = PokedexApiClient(baseUrl: "");
