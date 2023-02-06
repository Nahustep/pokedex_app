import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/routes/pages.dart';
import 'package:pokedex/routes/routes.dart';
import 'package:pokedex_api/pokedex_api.dart';
import 'package:pokedex_material/pokedex_material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xffe3311e),
      statusBarBrightness: Brightness.dark,
    ));
    return GetMaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      onInit: () {
        Responsive.init();
        defaultApiClient.baseUrl = API_URL;
      },
      initialRoute: Routes.HOME,
      getPages: Pages.pages,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primaryColor: PokedexColors.primaryColorBackground,
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
