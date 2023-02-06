part of pokedex_api;

class PokemonApi {
  final PokedexApiClient apiClient;
  PokemonApi([PokedexApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  Future<PokemonListModel> getPokemonList(
    int offset,
    int limit,
  ) async {
    try {
      var response = await Dio().get('${apiClient.baseUrl!}/pokemon?offset=$offset&limit=$limit');

      var json = response.data;
      if (response.statusCode == 200) {
        return PokemonListModel.fromJson(json);
      } else {
        throw PokedexApiError(code: response.statusCode!.toString(), message: response.data);
      }
    } on DioError catch (e) {
      throw PokedexApiError(code: e.response!.statusCode!.toString(), message: e.response!.statusCode!.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future<PokemonDetail> getPokemonDetail(
    String filter,
  ) async {
    try {
      var response = await Dio().get('${apiClient.baseUrl!}/pokemon/$filter');

      var json = response.data;
      if (response.statusCode == 200) {
        return PokemonDetail.fromJson(json);
      } else {
        throw PokedexApiError(code: response.statusCode!.toString(), message: response.data);
      }
    } on DioError catch (e) {
      throw PokedexApiError(code: e.response!.statusCode!.toString(), message: e.response!.statusCode!.toString());
    } catch (e) {
      rethrow;
    }
  }
}
