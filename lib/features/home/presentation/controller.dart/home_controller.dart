import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pokedex/core/widget/error_modal.dart';
import 'package:pokedex/features/home/domain/usecase/pokemon_detail.dart' as p;
import 'package:pokedex_api/pokedex_api.dart';
import 'package:pokedex_material/pokedex_material.dart';
import '../../../../core/errores/failure.dart';
import '../../../../core/services/storage_service.dart';
import '../../domain/usecase/home_usecase.dart' as h;
import '../widget.dart/pokemon_detail_widget.dart';

class HomeController extends GetxController {
  h.GetPokemonList getPokemonList;
  p.GetPokemonDetail getPokemonDetail;

  HomeController({required this.getPokemonList, required this.getPokemonDetail});
  RxList<PokemonDetail> pokemonsList = <PokemonDetail>[].obs;

  RxInt offset = 0.obs;
  RxInt limit = 25.obs;

  RxBool loading = false.obs;
  RxBool loadMore = false.obs;

  var count = 0;
  getPokemon() async {
    if (offset.value > count || loading.value) {
      return;
    }
    loading.value = true;
    loading.refresh();
    var response = await getPokemonList(h.Params(offset: offset.value, limit: limit.value));
    response.fold((l) {
      Get.dialog(
        ErrorModal(
          message: "An error has occurred,try again later.",
        ),
      );
      return;
    }, (r) async {
      count = r.count!;
      var needBreak = false;
      for (var i = 0; i < r.results!.length; i++) {
        if (needBreak) {
          break;
        }
        var element = r.results![i];
        var pokResponse = await getDetail(element.name!);
        pokResponse.fold((lp) {
          Get.dialog(
            ErrorModal(
              message: "An error has occurred,try again later.",
            ),
          );
          needBreak = true;
          return;
        }, (rp) {
          pokemonsList.add(rp);
        });
      }
      loading.value = false;
      offset.value = offset.value + limit.value;
      offset.refresh();
      loadMore.value = false;
      loadMore.refresh();
      pokemonsList.sort((a, b) => a.id!.compareTo(b.id!));
      pokemonsList.refresh();
      loading.refresh();
    });
  }

  Future<Either<Failure, PokemonDetail>> getDetail(String filter) async {
    return await getPokemonDetail(p.Params(filter: filter));
  }
}
