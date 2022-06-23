import 'package:app_posts/app/modules/posts/domain/entities/posts_with_user_entity.dart';
import 'package:app_posts/app/theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardPostsWidget extends StatefulWidget {
  final PostsWithUserEntity postsWithUserEntity;
  const CardPostsWidget({Key? key, required this.postsWithUserEntity})
      : super(key: key);

  @override
  State<CardPostsWidget> createState() => _CardPostsWidgetState();
}

class _CardPostsWidgetState extends State<CardPostsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      title: Row(
        children: [
          CircleAvatar(
            radius: 25,
            child: CachedNetworkImage(
              imageUrl: widget.postsWithUserEntity.userValueObject.avatarUrl,
              placeholder: (_, __) {
                return const Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                );
              },
              errorWidget: (_, __, ___) {
                return const Icon(
                  Icons.error,
                );
              },
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Flexible(
              child: Text(widget.postsWithUserEntity.userValueObject.name)),
        ],
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.postsWithUserEntity.postsValueObject.title,
            style: AppTheme.textStyles.title,
          ),
          const SizedBox(height: 10),
          Text(
            widget.postsWithUserEntity.postsValueObject.body,
            style: AppTheme.textStyles.body,
          ),
        ],
      ),
    );
  }
}
