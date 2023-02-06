import 'package:pokedex_material/pokedex_material.dart';
import 'package:pokedex_material/widget/text.dart';

class PokemonTypeWidget extends StatelessWidget {
  final String type;
  const PokemonTypeWidget({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive().isPortrait ? 20.wp : 6.wp,
      height: 4.hp,
      decoration: BoxDecoration(color: PokedexColors.getTypeColor(type), borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.5.hp, horizontal: 0.5.wp),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: CustomText.subtitle(
                  type,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
