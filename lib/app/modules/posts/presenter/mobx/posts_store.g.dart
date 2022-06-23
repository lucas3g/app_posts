// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostsStore on _PostsStoreBase, Store {
  Computed<PostsStates>? _$stateComputed;

  @override
  PostsStates get state =>
      (_$stateComputed ??= Computed<PostsStates>(() => super.state,
              name: '_PostsStoreBase.state'))
          .value;

  late final _$_stateAtom =
      Atom(name: '_PostsStoreBase._state', context: context);

  @override
  PostsStates get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(PostsStates value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$getPostsAPIAsyncAction =
      AsyncAction('_PostsStoreBase.getPostsAPI', context: context);

  @override
  Future<void> getPostsAPI() {
    return _$getPostsAPIAsyncAction.run(() => super.getPostsAPI());
  }

  late final _$_PostsStoreBaseActionController =
      ActionController(name: '_PostsStoreBase', context: context);

  @override
  PostsStates emit(PostsStates state) {
    final _$actionInfo = _$_PostsStoreBaseActionController.startAction(
        name: '_PostsStoreBase.emit');
    try {
      return super.emit(state);
    } finally {
      _$_PostsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
