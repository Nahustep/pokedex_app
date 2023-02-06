import 'package:get/get.dart';
import 'package:pokedex/features/home/presentation/widget.dart/pokemon_widget.dart';
import 'package:pokedex_material/pokedex_material.dart';
import 'package:pokedex_material/widget/form_field.dart';
import 'package:pokedex_material/widget/text.dart';
import '../../../../core/widget/pokemon_type_widget.dart';
import '../controller.dart/home_controller.dart';
import '../widget.dart/pokemon_search_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeController = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);

    Future.delayed(Duration.zero, () {
      homeController.limit.value = Responsive().isPortrait ? 4 : 25;
      homeController.getPokemon();
    });
  }

  ScrollController? controller;

  void _scrollListener() {
    if (controller!.position.pixels == (controller!.position.maxScrollExtent) && !homeController.loadMore.value) {
      homeController.loadMore.value = true;

      homeController.getPokemon();
    }
  }

  @override
  Widget build(BuildContext context) {
    recalculate(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(() => SafeArea(
              child: Container(
                width: 100.wp,
                height: 100.hp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.wp,
                      color: PokedexColors.primaryColorBackground,
                      height: 12.hp,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.wp),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText.title(
                              "POKEDEX",
                              color: PokedexColors.primaryColorLight,
                              textAlign: TextAlign.center,
                              typeFont: TypeFont.bold,
                            ),
                            Visibility(visible: !Responsive().isPortrait, child: Spacer()),
                            Visibility(visible: !Responsive().isPortrait, child: PokemonSearchWidget())
                          ],
                        ),
                      ),
                    ),
                    Container(
                        height: homeController.loading.value ? 85.hp : 88.hp,
                        width: 100.wp,
                        child: ListView(controller: controller, children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.wp, vertical: 2.hp),
                            child: CustomText.subtitle("Get information about your favorite pokemon here"),
                          ),
                          Visibility(
                              visible: Responsive().isPortrait,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.hp),
                                child: PokemonSearchWidget(),
                              )),
                          Padding(
                            padding: EdgeInsets.only(bottom: 0.5.hp, left: !Responsive().isPortrait ? 0 : 10.wp),
                            child: Wrap(
                              children: homeController.pokemonsList.map((element) => PokemonWidget(pokemon: element)).toList(),
                            ),
                          ),
                        ])),
                    Visibility(
                      visible: homeController.loading.value,
                      child: Container(
                        height: 3.hp,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: PokedexColors.primaryColorBackground,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
