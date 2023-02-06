import 'package:pokedex_material/pokedex_material.dart';
import 'package:pokedex_material/widget/text.dart';

class ErrorModal extends StatefulWidget {
  final String message;

  ErrorModal({required this.message});
  @override
  State<ErrorModal> createState() => _ErrorModalState();
}

class _ErrorModalState extends State<ErrorModal> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    recalculate(context);
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 3.wp),
          width: Responsive().isPortrait ? 35.wp : 20.wp,
          height: Responsive().isPortrait ? 35.hp : 10.hp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: PokedexColors.primaryColorLight,
          ),
          child: Column(
            children: [
              Expanded(child: Center(child: CustomText.subtitle(widget.message))),
            ],
          ),
        ));
  }
}
