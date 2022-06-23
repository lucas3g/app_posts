import 'package:app_posts/app/modules/posts/domain/repositories/posts_repository_interface.dart';
import 'package:app_posts/app/modules/posts/domain/usecases/get_posts_usecase.dart';
import 'package:app_posts/app/modules/posts/external/datasources/posts_api/posts_datasource.dart';
import 'package:app_posts/app/modules/posts/external/datasources/users_api/users_api_datasource.dart';
import 'package:app_posts/app/modules/posts/infra/datasources/posts/posts_datasource_interface.dart';
import 'package:app_posts/app/modules/posts/infra/datasources/users/users_datasource_interface.dart';
import 'package:app_posts/app/modules/posts/infra/repositories/posts_repository.dart';
import 'package:app_posts/app/modules/posts/presenter/mobx/posts_store.dart';

import 'presenter/posts_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PostsModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    //DATASOURCES
    Bind.factory<IPostsDataSource>(
      (i) => PostsAPIDataSource(clientHttpInterface: i()),
    ),
    Bind.factory<IUsersDataSource>(
      (i) => UsersAPIDataSource(clientHttpInterface: i()),
    ),

    //REPOSITORIES
    Bind.factory<IPostsRepository>(
      (i) => PostsRepository(postsDataSource: i(), usersDataSource: i()),
    ),

    //USECASES
    Bind.factory<IGetPostsUseCase>(
      (i) => GetPostsUseCase(postsRepository: i()),
    ),

    //MOBX
    Bind.singleton<PostsStore>(
      (i) => PostsStore(getPostsUseCase: i()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) => PostsPage(
            postsStore: Modular.get<PostsStore>(),
          )),
    ),
  ];
}
