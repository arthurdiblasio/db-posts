import 'package:blog_arthur/app/modules/home/detail/detail_page.dart';
import 'package:blog_arthur/app/modules/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

// Binds

// Pages and Modules

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/detail', child: (_, args) => DetailPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
