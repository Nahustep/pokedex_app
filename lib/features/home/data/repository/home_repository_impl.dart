import 'package:dartz/dartz.dart';
import 'package:pokedex_api/pokedex_api.dart';

import '../../../../core/errores/failure.dart';
import '../../domain/repository/home_repository.dart';
import '../data_source/home_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;
  HomeRepositoryImpl({
    required this.dataSource,
  });
  @override
  Future<Either<Failure, PokemonListModel>> getPokemonList(int offset, int limit) async {
    try {
      PokemonListModel topics = await dataSource.getPokemonList(offset, limit);
      return Right(topics);
    } on PokedexApiError catch (e) {
      return Left(ServerFailure(code: e.code, message: e.toString()));
    } catch (e) {
      return Left(ServerFailure(code: "500", message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PokemonDetail>> getPokemonDetail(String filter) async {
    try {
      PokemonDetail topics = await dataSource.getPokemonDetail(filter);
      return Right(topics);
    } on PokedexApiError catch (e) {
      return Left(ServerFailure(code: e.code, message: e.toString()));
    } catch (e) {
      return Left(ServerFailure(code: "500", message: e.toString()));
    }
  }
}
