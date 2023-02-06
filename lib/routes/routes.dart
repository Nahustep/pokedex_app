import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/home/presentation/controller.dart/home_binding.dart';
import '../features/home/presentation/page/home_page.dart';
import 'pages.dart';

class Pages {
  static Transition transitionDefault = Transition.noTransition;
  static Duration transitionDuration = Duration(microseconds: 0);
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      bindings: [
        HomeBindings(),
      ],
    ),
  ];
}
