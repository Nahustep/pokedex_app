import 'package:get/get.dart';
import 'package:pokedex/core/widget/pokemon_type_widget.dart';
import 'package:pokedex/features/home/presentation/widget.dart/pokemon_detail_mobile_widget.dart';
import 'package:pokedex/features/home/presentation/widget.dart/pokemon_size_widget.dart';
import 'package:pokedex/features/home/presentation/widget.dart/pokemon_stats_widget.dart';
import 'package:pokedex_api/pokedex_api.dart';
import 'package:pokedex_material/pokedex_material.dart';
import 'package:pokedex_material/widget/button.dart';
import 'package:pokedex_material/widget/form_field.dart';
import 'package:pokedex_material/widget/text.dart';

import '../../../../core/services/util.dart';
import '../controller.dart/home_controller.dart';
import '../controller.dart/pokemon_detail_controller.dart';

typedef void OnComparatorChanged(bool value);

class PokemonModal extends StatefulWidget {
  final PokemonDetail pokemon;

  const PokemonModal({super.key, required this.pokemon});

  @override
  State<PokemonModal> createState() => _PokemonModalState();
}

class _PokemonModalState extends State<PokemonModal> {
  var pokemonDetailController = Get.find<PokemonDetailController>();

  @override
  Widget build(BuildContext context) {
    recalculate(context);
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Obx(
          () => Container(
              width: Responsive().isPortrait
                  ? pokemonDetailController.showComparator.value
                      ? 95.wp
                      : 80.wp
                  : pokemonDetailController.showComparator.value
                      ? 80.wp
                      : 40.wp,
              height: Responsive().isPortrait ? 100.hp : 90.hp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: PokedexColors.primaryColorLight,
              ),
              child: !Responsive().isPortrait
                  ? PokemonDetailWidget(
                      pokemon: widget.pokemon,
                    )
                  : PokemonDetailMobileWidget(
                      pokemon: widget.pokemon,
                    )),
        ));
  }
}

class PokemonDetailWidget extends StatefulWidget {
  final PokemonDetail pokemon;
  const PokemonDetailWidget({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonDetailWidget> createState() => _PokemonDetailWidgetState();
}

class _PokemonDetailWidgetState extends State<PokemonDetailWidget> {
  var pokemonDetailController = Get.find<PokemonDetailController>();
  var showButton = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16.wp,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.hp, horizontal: 2.wp),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText.subtitle(
                          "Normal",
                          textAlign: TextAlign.center,
                        ),
                        Image.network(
                          widget.pokemon.sprites!.frontDefault!,
                          width: 14.wp,
                          height: 14.hp,
                          fit: BoxFit.contain,
                        ),
                        Image.network(
                          widget.pokemon.sprites!.backDefault!,
                          width: 14.wp,
                          height: 14.hp,
                          fit: BoxFit.contain,
                        ),
                        CustomText.subtitle(
                          "Shiny ",
                          textAlign: TextAlign.center,
                        ),
                        Image.network(
                          widget.pokemon.sprites!.frontShiny!,
                          width: 14.wp,
                          height: 14.hp,
                          fit: BoxFit.contain,
                        ),
                        Image.network(
                          widget.pokemon.sprites!.backShiny!,
                          width: 14.wp,
                          height: 14.hp,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.hp, horizontal: 2.wp),
                    child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
                      CustomText.title(
                        capitalize(widget.pokemon.name!),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                      CustomText.body(
                        "N°${widget.pokemon.id}",
                        textAlign: TextAlign.center,
                        color: PokedexColors.secondaryTextColor,
                      ),
                      Container(
                        width: 16.wp,
                        padding: EdgeInsets.symmetric(vertical: 2.hp),
                        child: PokemonSizeWidget(
                          weight: widget.pokemon.weight.toString(),
                          height: widget.pokemon.height.toString(),
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 2.hp), child: PokemonStatsWidget(stats: widget.pokemon.stats!)),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.5.hp),
                        child: CustomText.subtitle(
                          "Type",
                          textAlign: TextAlign.center,
                          color: PokedexColors.secondaryTextColor,
                          typeFont: TypeFont.semibold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: widget.pokemon.types!
                            .map((e) => Padding(
                                  padding: EdgeInsets.symmetric(horizontal: Responsive().isPortrait ? 1.wp : 0.2.wp),
                                  child: PokemonTypeWidget(type: capitalize(e.type!.name!)),
                                ))
                            .toList(),
                      ),
                      Container(
                        width: 16.wp,
                        padding: EdgeInsets.symmetric(vertical: 1.5.hp),
                        child: CustomButton(
                            text: "Compare Pokemon",
                            onPress: () {
                              setState(() {
                                showButton = true;
                              });
                            }),
                      ),
                    ]),
                  ),
                ],
              ),
              Visibility(
                visible: showButton,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20.wp,
                      padding: EdgeInsets.only(right: 1.wp),
                      child: CustomFormField(
                        onFieldSubmitted: (value) async {
                          if (value.isNotEmpty) {
                            await pokemonDetailController.findPokemonToCompare(value);
                          }
                        },
                        withBorder: true,
                        label: "Name or pokedex number",
                        initialText: "",
                        textColor: PokedexColors.primaryColorText,
                        onChanged: (val) {
                          pokemonDetailController.compareFilter.value = val;
                        },
                      ),
                    ),
                    Container(
                        width: 8.wp,
                        child: CustomButton(
                            text: "Search",
                            onPress: () async {
                              await pokemonDetailController.findPokemonToCompare(pokemonDetailController.compareFilter.value);
                            })),
                  ],
                ),
              )
            ],
          ),
          Obx(() => pokemonDetailController.showComparator.value
              ? pokemonDetailController.pokemonToCompare.value.id != null
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.hp, horizontal: 2.wp),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText.subtitle(
                                "Normal",
                                textAlign: TextAlign.center,
                              ),
                              Image.network(
                                pokemonDetailController.pokemonToCompare.value.sprites!.frontDefault!,
                                width: 14.wp,
                                height: 14.hp,
                                fit: BoxFit.contain,
                              ),
                              Image.network(
                                pokemonDetailController.pokemonToCompare.value.sprites!.backDefault!,
                                width: 14.wp,
                                height: 14.hp,
                                fit: BoxFit.contain,
                              ),
                              CustomText.subtitle(
                                "Shiny ",
                                textAlign: TextAlign.center,
                              ),
                              Image.network(
                                pokemonDetailController.pokemonToCompare.value.sprites!.frontShiny!,
                                width: 14.wp,
                                height: 14.hp,
                                fit: BoxFit.contain,
                              ),
                              Image.network(
                                pokemonDetailController.pokemonToCompare.value.sprites!.backShiny!,
                                width: 14.wp,
                                height: 14.hp,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.hp, horizontal: 2.wp),
                          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
                            CustomText.title(
                              capitalize(pokemonDetailController.pokemonToCompare.value.name!),
                              maxLines: 1,
                              textAlign: TextAlign.center,
                            ),
                            CustomText.body(
                              "N°${pokemonDetailController.pokemonToCompare.value.id}",
                              textAlign: TextAlign.center,
                              color: PokedexColors.secondaryTextColor,
                            ),
                            Container(
                              width: 16.wp,
                              padding: EdgeInsets.symmetric(vertical: 2.hp),
                              child: PokemonSizeWidget(
                                weight: pokemonDetailController.pokemonToCompare.value.weight.toString(),
                                height: pokemonDetailController.pokemonToCompare.value.height.toString(),
                              ),
                            ),
                            Padding(padding: EdgeInsets.symmetric(vertical: 2.hp), child: PokemonStatsWidget(stats: pokemonDetailController.pokemonToCompare.value.stats!)),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.5.hp),
                              child: CustomText.subtitle(
                                "Type",
                                textAlign: TextAlign.center,
                                color: PokedexColors.secondaryTextColor,
                                typeFont: TypeFont.semibold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: pokemonDetailController.pokemonToCompare.value.types!
                                  .map((e) => Padding(
                                        padding: EdgeInsets.symmetric(horizontal: Responsive().isPortrait ? 1.wp : 0.2.wp),
                                        child: PokemonTypeWidget(type: capitalize(e.type!.name!)),
                                      ))
                                  .toList(),
                            ),
                          ]),
                        ),
                      ],
                    )
                  : Container()
              : Container())
        ],
      ),
    );
  }
}
