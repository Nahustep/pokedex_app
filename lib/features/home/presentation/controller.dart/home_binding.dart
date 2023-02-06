import 'package:get/get.dart';
import 'package:pokedex/features/home/domain/usecase/pokemon_detail.dart';
import 'package:pokedex/features/home/presentation/controller.dart/pokemon_detail_controller.dart';
import '../../data/data_source/home_data_source.dart';
import '../../data/repository/home_repository_impl.dart';
import '../../domain/repository/home_repository.dart';
import '../../domain/usecase/home_usecase.dart';
import 'home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    //hot topic
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(dataSource: Get.find()), fenix: true);
    Get.lazyPut<HomeDataSource>(() => HomeDataSourceImpl(), fenix: true);
    Get.lazyPut<GetPokemonList>(() => GetPokemonList(Get.find()), fenix: true);
    Get.lazyPut<GetPokemonDetail>(() => GetPokemonDetail(Get.find()), fenix: true);

    Get.lazyPut(
      () => HomeController(
        getPokemonDetail: Get.find(),
        getPokemonList: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => PokemonDetailController(
        getPokemonDetail: Get.find(),
      ),
      fenix: true,
    );
  }
}
