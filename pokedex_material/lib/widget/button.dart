import 'package:pokedex_material/widget/text.dart';

import '../pokedex_material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPress;

  CustomButton({Key? key, required this.text, required this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.wp,
      child: TextButton(
        onPressed: onPress,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            PokedexColors.primaryColorBackground,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.hp),
          child: CustomText.subtitle(
            text,
            color: PokedexColors.primaryColorLight,
            typeFont: TypeFont.semibold,
          ),
        ),
      ),
    );
  }
}
