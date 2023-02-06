import 'package:pokedex_api/pokedex_api.dart';
import 'package:pokedex_material/pokedex_material.dart';
import 'package:pokedex_material/widget/text.dart';

class PokemonSizeWidget extends StatelessWidget {
  final String height;
  final String weight;

  const PokemonSizeWidget({super.key, required this.weight, required this.height});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: CustomText.subtitle(
              "Height",
              color: PokedexColors.secondaryTextColor,
              typeFont: TypeFont.semibold,
            )),
            Expanded(
                child: CustomText.subtitle(
              "Weight",
              color: PokedexColors.secondaryTextColor,
              typeFont: TypeFont.semibold,
            ))
          ],
        ),
        Row(
          children: [Expanded(child: CustomText.subtitle("$height M", typeFont: TypeFont.regular)), Expanded(child: CustomText.subtitle("$weight KG", typeFont: TypeFont.regular))],
        )
      ],
    );
  }
}
