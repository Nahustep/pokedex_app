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

class PokemonDetailController extends GetxController {
  p.GetPokemonDetail getPokemonDetail;

  PokemonDetailController({required this.getPokemonDetail});
  RxString compareFilter = "".obs;
  RxString filter = "".obs;

  Future<Either<Failure, PokemonDetail>> getDetail(String filter) async {
    return await getPokemonDetail(p.Params(filter: filter));
  }

  searchPokemon(String filter) async {
    var response = await getDetail(filter);
    Get.dialog(
        Center(
            child: CircularProgressIndicator(
          color: PokedexColors.primaryColorBackground,
        )),
        barrierDismissible: false);
    response.fold((l) {
      Get.back();

      Get.dialog(
        ErrorModal(
          message: "Pokemon not found",
        ),
      );
    }, (r) {
      Get.back();
      Get.dialog(
        PokemonModal(
          pokemon: r,
        ),
      ).whenComplete(() => showComparator.value = false);
    });
  }

// MOVER
  RxBool showComparator = false.obs;

  Rx<PokemonDetail> pokemonToCompare = PokemonDetail().obs;
  findPokemonToCompare(String filter) async {
    Get.dialog(
        Center(
            child: CircularProgressIndicator(
          color: PokedexColors.primaryColorBackground,
        )),
        barrierDismissible: false);
    var response = await getDetail(filter);
    response.fold((l) {
      Get.back();
      Get.dialog(
        ErrorModal(
          message: "Pokemon not found",
        ),
      ).whenComplete(() {
        showComparator.value = false;
        showComparator.refresh();
      });
    }, (r) {
      pokemonToCompare.value = r;
      pokemonToCompare.refresh();
      showComparator.value = true;
      showComparator.refresh();
      Get.back();
    });
  }
}
