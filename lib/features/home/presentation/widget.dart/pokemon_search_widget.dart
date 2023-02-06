import 'package:get/get.dart';
import 'package:pokedex_material/pokedex_material.dart';
import 'package:pokedex_material/widget/form_field.dart';
import 'package:pokedex_material/widget/text.dart';

import '../controller.dart/home_controller.dart';
import '../controller.dart/pokemon_detail_controller.dart';

class PokemonSearchWidget extends StatelessWidget {
  var pokemonDetailController = Get.find<PokemonDetailController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: !Responsive().isPortrait ? 6.hp : 5.5.hp,
          width: !Responsive().isPortrait ? 20.wp : 60.wp,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), topLeft: Radius.circular(15)),
            color: PokedexColors.primaryColorLight,
          ),
          child: Center(
            child: CustomFormField(
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  pokemonDetailController.searchPokemon(value);
                }
              },
              label: "Name or pokedex number",
              initialText: "",
              textColor: PokedexColors.primaryColorText,
              onChanged: (val) {
                pokemonDetailController.filter.value = val;
              },
            ),
          ),
        ),
        InkWell(
          onTap: () {
            if (pokemonDetailController.filter.value.isNotEmpty) {
              pokemonDetailController.searchPokemon(pokemonDetailController.filter.value);
            }
          },
          child: Container(
            height: !Responsive().isPortrait ? 6.hp : 5.5.hp,
            width: !Responsive().isPortrait ? 6.wp : 20.wp,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
              color: !Responsive().isPortrait ? PokedexColors.primaryColorLight : PokedexColors.primaryColorBackground,
            ),
            child: Icon(
              Icons.search,
              color: Responsive().isPortrait ? PokedexColors.primaryColorLight : PokedexColors.primaryColorBackground,
            ),
          ),
        ),
      ],
    );
  }
}
