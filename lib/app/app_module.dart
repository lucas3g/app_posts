import 'package:app_posts/app/modules/posts/posts_module.dart';

import 'core_module/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
    PostsModule(),
  ];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [ModuleRoute('/', module: PostsModule())];
}
