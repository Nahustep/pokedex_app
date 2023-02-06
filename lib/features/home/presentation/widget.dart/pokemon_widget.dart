import 'package:get/get.dart';
import 'package:pokedex/core/widget/pokemon_type_widget.dart';
import 'package:pokedex/features/home/presentation/widget.dart/pokemon_detail_widget.dart';
import 'package:pokedex_api/pokedex_api.dart';
import 'package:pokedex_material/pokedex_material.dart';
import 'package:pokedex_material/widget/text.dart';

import '../../../../core/services/util.dart';
import '../controller.dart/pokemon_detail_controller.dart';

class PokemonWidget extends StatefulWidget {
  final PokemonDetail pokemon;
  const PokemonWidget({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonWidget> createState() => _PokemonWidgetState();
}

class _PokemonWidgetState extends State<PokemonWidget> {
  final pokemonDetailController = Get.find<PokemonDetailController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: !Responsive().isPortrait ? 20.wp : 80.wp,
      child: InkWell(
        onTap: () => Get.dialog(
          PokemonModal(
            pokemon: widget.pokemon,
          ),
        ).whenComplete(() => pokemonDetailController.showComparator.value = false),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: !Responsive().isPortrait ? 0 : 2.hp),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.only(bottom: 2.hp),
              child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: [
                Image.network(
                  widget.pokemon.sprites!.frontDefault!,
                  height: 15.hp,
                  fit: BoxFit.fitHeight,
                ),
                CustomText.bodySmall(
                  "N°${widget.pokemon.id}",
                  textAlign: TextAlign.center,
                  color: PokedexColors.secondaryTextColor,
                ),
                CustomText.title(
                  capitalize(widget.pokemon.name!),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: widget.pokemon.types!
                      .map((e) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: Responsive().isPortrait ? 1.wp : 0.2.wp),
                            child: PokemonTypeWidget(type: capitalize(e.type!.name!)),
                          ))
                      .toList(),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
