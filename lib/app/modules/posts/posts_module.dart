import 'package:app_posts/app/modules/posts/domain/usecases/get_posts_usecase.dart';
import 'package:app_posts/app/modules/posts/external/datasources/posts_api/posts_datasource.dart';
import 'package:app_posts/app/modules/posts/external/datasources/users/users_api_datasource.dart';
import 'package:app_posts/app/modules/posts/infra/repositories/post_repository.dart';
import 'package:app_posts/app/modules/posts/presenter/controllers/posts_controller.dart';

import 'presenter/posts_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PostsModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.factory((i) => PostsAPIDataSource(clientHttpInterface: i())),
    Bind.factory((i) => UsersAPIDataSource(clientHttpInterface: i())),
    Bind.factory(
        (i) => PostsRepository(postsDataSource: i(), usersDataSource: i())),
    Bind.factory((i) => GetPostsUseCase(postsRepository: i())),
    Bind.singleton((i) => PostsController(getPostsUseCase: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) => PostsPage(
            postsController: Modular.get<PostsController>(),
          )),
    ),
  ];
}
