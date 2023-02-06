import 'package:pokedex_material/widget/text.dart';

import '../pokedex_material.dart';

class CustomFormField extends StatefulWidget {
  final String label;
  final Function(String) onChanged;
  final Color textColor;
  final String initialText;
  final Function(String) onFieldSubmitted;
  final bool withBorder;
  CustomFormField({required this.label, required this.onChanged, required this.textColor, required this.initialText, required this.onFieldSubmitted, this.withBorder = false});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.initialText);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(border: widget.withBorder ? UnderlineInputBorder(borderSide: BorderSide(color: PokedexColors.primaryColorBackground)) : InputBorder.none, focusedBorder: widget.withBorder ? UnderlineInputBorder(borderSide: BorderSide(color: PokedexColors.primaryColorBackground)) : InputBorder.none, hintText: widget.label, floatingLabelBehavior: FloatingLabelBehavior.always, contentPadding: EdgeInsets.symmetric(horizontal: 2.wp, vertical: 2.5.hp)),
      onChanged: widget.onChanged,
      controller: controller,
      onFieldSubmitted: widget.onFieldSubmitted,
      style: TextStyle(fontFamily: getFontFamily(TypeFont.regular), color: widget.textColor),
    );
  }
}
