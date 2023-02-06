import 'package:dartz/dartz.dart';
import 'package:pokedex_api/pokedex_api.dart';

import '../../../../core/errores/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, PokemonListModel>> getPokemonList(int offset, int limit);
  Future<Either<Failure, PokemonDetail>> getPokemonDetail(String filter);
}
