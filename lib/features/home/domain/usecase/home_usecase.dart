import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_api/pokedex_api.dart';

import '../../../../core/errores/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/home_repository.dart';

class GetPokemonList implements UseCase<PokemonListModel, Params> {
  final HomeRepository repository;

  GetPokemonList(this.repository);

  @override
  Future<Either<Failure, PokemonListModel>> call(Params params) async {
    var response = await repository.getPokemonList(params.offset, params.limit);
    return response;
  }
}

class Params extends Equatable {
  final int offset;
  final int limit;

  Params({
    required this.offset,
    required this.limit,
  });

  @override
  List<Object> get props => [limit, offset];
}
