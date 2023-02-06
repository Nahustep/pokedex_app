import 'package:pokedex/core/services/util.dart';
import 'package:pokedex_api/pokedex_api.dart';
import 'package:pokedex_material/pokedex_material.dart';
import 'package:pokedex_material/widget/text.dart';
import 'package:quiver/iterables.dart';

class PokemonStatsWidget extends StatefulWidget {
  final List<Stat> stats;

  const PokemonStatsWidget({super.key, required this.stats});

  @override
  State<PokemonStatsWidget> createState() => _PokemonStatsWidgetState();
}

class _PokemonStatsWidgetState extends State<PokemonStatsWidget> {
  @override
  void initState() {
    statsSplited = partition(widget.stats, 2).toList();
    super.initState();
  }

  List<List<Stat>> statsSplited = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText.subtitle(
          "Stats",
          color: PokedexColors.secondaryTextColor,
          typeFont: TypeFont.semibold,
        ),
        Column(
            children: statsSplited
                .map(
                  (e) => Row(
                    children: e
                        .map((e) => Container(
                              padding: EdgeInsets.symmetric(vertical: 1.hp),
                              height: 8.hp,
                              width: !Responsive().isPortrait ? 8.wp : 37.wp,
                              child: Column(
                                children: [
                                  Expanded(child: CustomText.subtitle(capitalize(e.stat!.name!), color: PokedexColors.secondaryTextColor, typeFont: TypeFont.regular)),
                                  Container(height: 1.hp),
                                  Expanded(
                                      child: CustomText.subtitle(
                                    e.baseStat.toString(),
                                    typeFont: TypeFont.regular,
                                  )),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                )
                .toList())
      ],
    );
  }
}
