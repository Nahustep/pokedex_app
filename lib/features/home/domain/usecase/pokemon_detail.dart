import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_api/pokedex_api.dart';

import '../../../../core/errores/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/home_repository.dart';

class GetPokemonDetail implements UseCase<PokemonDetail, Params> {
  final HomeRepository repository;

  GetPokemonDetail(this.repository);

  @override
  Future<Either<Failure, PokemonDetail>> call(Params params) async {
    var response = await repository.getPokemonDetail(params.filter);
    return response;
  }
}

class Params extends Equatable {
  final String filter;

  Params({
    required this.filter,
  });

  @override
  List<Object> get props => [filter];
}
