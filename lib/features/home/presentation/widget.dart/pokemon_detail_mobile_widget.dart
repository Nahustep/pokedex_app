import 'package:get/get.dart';
import 'package:pokedex/core/widget/pokemon_type_widget.dart';
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

class PokemonDetailMobileWidget extends StatefulWidget {
  final PokemonDetail pokemon;
  const PokemonDetailMobileWidget({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonDetailMobileWidget> createState() => _PokemonDetailMobileWidgetState();
}

class _PokemonDetailMobileWidgetState extends State<PokemonDetailMobileWidget> {
  var pokemonDetailController = Get.find<PokemonDetailController>();
  var showButton = false;
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.wp,
      child: Column(
        children: [
          SizedBox(
            height: 76.hp,
            child: RawScrollbar(
              controller: scrollController,
              thumbVisibility: true,
              thumbColor: PokedexColors.primaryColorBackground,
              radius: const Radius.circular(20),
              thickness: 5,
              child: ListView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                children: [
                  Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Image.network(
                      widget.pokemon.sprites!.frontDefault!,
                      width: 50.wp,
                      height: 18.hp,
                      fit: BoxFit.contain,
                    ),
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
                      width: 80.wp,
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
                                padding: EdgeInsets.symmetric(horizontal: 1.wp, vertical: 0.5.hp),
                                child: PokemonTypeWidget(type: capitalize(e.type!.name!)),
                              ))
                          .toList(),
                    ),
                  ]),
                  Obx(() => pokemonDetailController.showComparator.value
                      ? pokemonDetailController.pokemonToCompare.value.id != null
                          ? Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
                              Image.network(
                                pokemonDetailController.pokemonToCompare.value.sprites!.frontDefault!,
                                width: 50.wp,
                                height: 18.hp,
                                fit: BoxFit.contain,
                              ),
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
                                width: 80.wp,
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
                            ])
                          : Container()
                      : Container())
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.wp, vertical: 1.hp),
            child: CustomButton(
                text: "Compare Pokemon",
                onPress: () {
                  setState(() {
                    showButton = !showButton;
                  });
                }),
          ),
          Visibility(
            visible: showButton,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 45.wp,
                  padding: EdgeInsets.only(right: 1.wp),
                  child: CustomFormField(
                    onFieldSubmitted: (value) async {
                      if (value.isNotEmpty) {
                        await pokemonDetailController.findPokemonToCompare(value);
                        if (pokemonDetailController.showComparator.value) {
                          //scrollController.animateTo(80.wp, duration: Duration.zero, curve: Curves.ease);
                        }
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
                    width: 25.wp,
                    child: CustomButton(
                        text: "Search",
                        onPress: () async {
                          await pokemonDetailController.findPokemonToCompare(pokemonDetailController.compareFilter.value);
                          if (pokemonDetailController.showComparator.value) {
                            // scrollController.animateTo(80.wp, duration: Duration.zero, curve: Curves.ease);
                          }
                        })),
              ],
            ),
          )
        ],
      ),
    );
  }
}
