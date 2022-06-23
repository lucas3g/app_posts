import 'package:app_posts/app/modules/posts/domain/entities/post_entity.dart';
import 'package:app_posts/app/theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardPostsWidget extends StatefulWidget {
  final PostEntity postsWithUserEntity;
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
              imageUrl: widget.postsWithUserEntity.user.avatarUrl,
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
          Flexible(child: Text(widget.postsWithUserEntity.user.name)),
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
            widget.postsWithUserEntity.title,
            style: AppTheme.textStyles.title,
          ),
          const SizedBox(height: 10),
          Text(
            widget.postsWithUserEntity.body,
            style: AppTheme.textStyles.body,
          ),
        ],
      ),
    );
  }
}
