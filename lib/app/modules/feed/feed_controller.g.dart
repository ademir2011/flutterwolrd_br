// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedController on _FeedControllerBase, Store {
  final _$yt_controllersAtom = Atom(name: '_FeedControllerBase.yt_controllers');

  @override
  ObservableList<YoutubePlayerController> get yt_controllers {
    _$yt_controllersAtom.context.enforceReadPolicy(_$yt_controllersAtom);
    _$yt_controllersAtom.reportObserved();
    return super.yt_controllers;
  }

  @override
  set yt_controllers(ObservableList<YoutubePlayerController> value) {
    _$yt_controllersAtom.context.conditionallyRunInAction(() {
      super.yt_controllers = value;
      _$yt_controllersAtom.reportChanged();
    }, _$yt_controllersAtom, name: '${_$yt_controllersAtom.name}_set');
  }

  final _$_FeedControllerBaseActionController =
      ActionController(name: '_FeedControllerBase');

  @override
  void addYoutubePlayerController({String initialVideoId}) {
    final _$actionInfo = _$_FeedControllerBaseActionController.startAction();
    try {
      return super.addYoutubePlayerController(initialVideoId: initialVideoId);
    } finally {
      _$_FeedControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
