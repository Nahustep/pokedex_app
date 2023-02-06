import 'package:pokedex_api/pokedex_api.dart';

abstract class HomeDataSource {
  Future<PokemonListModel> getPokemonList(int offset, int limit);
  Future<PokemonDetail> getPokemonDetail(String filter);
}

class HomeDataSourceImpl implements HomeDataSource {
  HomeDataSourceImpl();

  @override
  Future<PokemonListModel> getPokemonList(int offset, int limit) async {
    try {
      return await PokemonApi().getPokemonList(offset, limit);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PokemonDetail> getPokemonDetail(String filter) async {
    try {
      return await PokemonApi().getPokemonDetail(filter);
    } catch (e) {
      rethrow;
    }
  }
}
