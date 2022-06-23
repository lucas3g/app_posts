import 'package:app_posts/app/modules/posts/presenter/mobx/posts_store.dart';
import 'package:app_posts/app/modules/posts/presenter/states/posts_states.dart';
import 'package:app_posts/app/modules/posts/presenter/widgets/card_posts_widget.dart';
import 'package:app_posts/app/theme/app_theme.dart';
import 'package:app_posts/app/utils/constants.dart';
import 'package:app_posts/app/utils/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PostsPage extends StatefulWidget {
  final PostsStore postsStore;

  const PostsPage({Key? key, required this.postsStore}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  Future<void> getPosts() async {
    await widget.postsStore.getPostsAPI();
  }

  @override
  void initState() {
    super.initState();

    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.primary,
      appBar: AppBar(
        title: Text(
          'Posts',
          style: AppTheme.textStyles.appBar,
        ),
        centerTitle: true,
        elevation: 1,
        shadowColor: AppTheme.colors.appBar,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Observer(
          builder: (_) {
            if (widget.postsStore.state is DontHaveInternetState) {
              return const Center(
                child: Text('Parece que você esta sem internet.'),
              );
            }

            if (widget.postsStore.state is! PostsGetAPISuccessState) {
              return ListView.separated(
                itemBuilder: (_, index) {
                  return LoadingWidget(
                      size: Size(context.screenWidth, 150), radius: 10);
                },
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemCount: 10,
              );
            }

            if (widget.postsStore.state is PostsGetAPISuccessState) {
              final list = (widget.postsStore.state as PostsGetAPISuccessState)
                  .listPostWithUsers;

              if (list.isEmpty) {
                return const Center(
                  child: Text('Nenhum post encontrado'),
                );
              }

              return ListView.separated(
                itemBuilder: (context, index) {
                  return CardPostsWidget(postsWithUserEntity: list[index]);
                },
                separatorBuilder: (_, __) => const Divider(),
                itemCount: list.length,
              );
            }

            return Container(); //Só para o observer parar de reclamar
          },
        ),
      ),
    );
  }
}
