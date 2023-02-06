import 'package:flutter/material.dart';

class PokedexColors {
  static Color primaryColorLight = Colors.white;

  static Color primaryColorBackground = const Color(0xffe3311e);
  static Color primaryColorText = const Color(0xff4a4948);
  static Color secondaryTextColor = const Color(0xff919191);
//pokemon types
  static Color normalColor = const Color(0xffA8A878);
  static Color fireColor = const Color(0xffF08030);
  static Color fightingColor = const Color(0xffC03028);
  static Color waterColor = const Color(0xff6890F0);
  static Color flyingColor = const Color(0xffA890F0);
  static Color grassColor = const Color(0xff78C850);
  static Color poisonColor = const Color(0xffA040A0);
  static Color electricColor = const Color(0xffF8D030);
  static Color groundColor = const Color(0xffE0C068);
  static Color physicColor = const Color(0xffF85888);
  static Color rockColor = const Color(0xffB8A038);
  static Color iceColor = const Color(0xff98D8D8);
  static Color bugColor = const Color(0xffA8B820);
  static Color dragonColor = const Color(0xff7038F8);
  static Color ghostColor = const Color(0xff705898);
  static Color darkColor = const Color(0xff705848);
  static Color steelColor = const Color(0xffB8B8D0);
  static Color fairyColor = const Color(0xffEE99AC);

  static Color getTypeColor(String type) {
    switch (type) {
      case "Normal":
        return normalColor;
      case "Fire":
        return fireColor;
      case "Water":
        return waterColor;
      case "Grass":
        return grassColor;
      case "Flying":
        return flyingColor;
      case "Fighting":
        return fightingColor;
      case "Poison":
        return poisonColor;
      case "Electric":
        return electricColor;
      case "Ground":
        return groundColor;
      case "Rock":
        return rockColor;
      case "Psychic":
        return physicColor;
      case "Ice":
        return iceColor;
      case "Bug":
        return bugColor;
      case "Ghost":
        return ghostColor;
      case "Steel":
        return steelColor;
      case "Dragon":
        return dragonColor;
      case "Dark":
        return darkColor;
      case "Fairy":
        return fairyColor;
    }
    return Colors.transparent;
  }
}
