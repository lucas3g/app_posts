// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostsController on _PostsControllerBase, Store {
  late final _$listPostWithUsersAtom =
      Atom(name: '_PostsControllerBase.listPostWithUsers', context: context);

  @override
  ObservableList<PostsWithUserEntity> get listPostWithUsers {
    _$listPostWithUsersAtom.reportRead();
    return super.listPostWithUsers;
  }

  @override
  set listPostWithUsers(ObservableList<PostsWithUserEntity> value) {
    _$listPostWithUsersAtom.reportWrite(value, super.listPostWithUsers, () {
      super.listPostWithUsers = value;
    });
  }

  late final _$stateAtom =
      Atom(name: '_PostsControllerBase.state', context: context);

  @override
  PostsStates get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(PostsStates value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getPostsAPIAsyncAction =
      AsyncAction('_PostsControllerBase.getPostsAPI', context: context);

  @override
  Future<void> getPostsAPI() {
    return _$getPostsAPIAsyncAction.run(() => super.getPostsAPI());
  }

  late final _$_PostsControllerBaseActionController =
      ActionController(name: '_PostsControllerBase', context: context);

  @override
  PostsStates emit(PostsStates state) {
    final _$actionInfo = _$_PostsControllerBaseActionController.startAction(
        name: '_PostsControllerBase.emit');
    try {
      return super.emit(state);
    } finally {
      _$_PostsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listPostWithUsers: ${listPostWithUsers},
state: ${state}
    ''';
  }
}
