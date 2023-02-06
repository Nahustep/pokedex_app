import 'package:auto_size_text/auto_size_text.dart';

import '../pokedex_material.dart';

enum TypeFont { semibold, medium, regular, light, bold }

class CustomText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TypeFont? typeFont;
  final Color? color;
  final double maxFontSize;
  final double minFontSize;
  final int maxLines;

  const CustomText({required this.text, required this.textAlign, required this.typeFont, this.color, required this.maxFontSize, required this.minFontSize, this.maxLines = 10});

  factory CustomText.title(String text, {TextAlign? textAlign, TypeFont? typeFont, Color? color, int? maxLines}) {
    return CustomText(text: text, maxLines: maxLines ?? 10, textAlign: textAlign ?? TextAlign.center, color: color ?? PokedexColors.primaryColorText, typeFont: typeFont ?? TypeFont.medium, maxFontSize: !Responsive().isPortrait ? 35 : 16, minFontSize: 10);
  }

  factory CustomText.titleLarge(String text, {TextAlign? textAlign, TypeFont? typeFont, Color? color, int? maxLines}) {
    return CustomText(text: text, maxLines: maxLines ?? 10, textAlign: textAlign ?? TextAlign.center, color: color ?? PokedexColors.primaryColorText, typeFont: typeFont ?? TypeFont.medium, maxFontSize: !Responsive().isPortrait ? 50 : 18, minFontSize: 10);
  }
  factory CustomText.subtitle(String text, {TextAlign? textAlign, TypeFont? typeFont, Color? color, int? maxLines}) {
    return CustomText(
      text: text,
      textAlign: textAlign ?? TextAlign.center,
      color: color ?? PokedexColors.primaryColorText,
      typeFont: typeFont ?? TypeFont.semibold,
      maxFontSize: !Responsive().isPortrait ? 20 : 14,
      minFontSize: 10,
      maxLines: maxLines ?? 10,
    );
  }
  factory CustomText.body(
    String text, {
    TextAlign? textAlign,
    TypeFont? typeFont,
    Color? color,
  }) {
    return CustomText(text: text, textAlign: textAlign ?? TextAlign.center, color: color ?? PokedexColors.primaryColorText, typeFont: typeFont ?? TypeFont.semibold, maxFontSize: !Responsive().isPortrait ? 15 : 12, minFontSize: 10);
  }
  factory CustomText.bodySmall(
    String text, {
    TextAlign? textAlign,
    TypeFont? typeFont,
    Color? color,
  }) {
    return CustomText(text: text, textAlign: textAlign ?? TextAlign.center, color: color ?? PokedexColors.primaryColorText, typeFont: typeFont ?? TypeFont.regular, maxFontSize: 14, minFontSize: 13);
  }
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      minFontSize: minFontSize,
      maxLines: maxLines,
      //overflow: TextOverflow.fade,
      style: TextStyle(
        color: color,
        fontSize: maxFontSize,
        fontFamily: getFontFamily(typeFont),
      ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}

getFontFamily(typeFont) {
  switch (typeFont) {
    case TypeFont.semibold:
      return 'Montserrat-SemiBold';
    case TypeFont.medium:
      return 'Montserrat-Medium';
    case TypeFont.regular:
      return 'Montserrat-Regular';
    case TypeFont.light:
      return 'Montserrat-Light';
    case TypeFont.bold:
      return 'Heebo-Bold';
    default:
  }
  return "Montserrat-Regular";
}
