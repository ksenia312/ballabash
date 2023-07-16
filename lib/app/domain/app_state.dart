import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

typedef ErrorMapper = Object? Function(Object? error);

class AppState<T> with EquatableMixin {
  AppState._({
    required this.inProgress,
    this.data,
    this.error,
  });

  factory AppState.nothing() => AppState._(inProgress: false);

  factory AppState.data(T data) => AppState._(
        data: data,
        inProgress: false,
      );

  factory AppState.progress({T? saveData}) => AppState._(
        inProgress: true,
        data: saveData,
      );

  factory AppState.error({Object? error, T? saveData}) => AppState._(
        error: error,
        inProgress: false,
        data: saveData,
      );

  final T? data;

  final Object? error;

  final bool inProgress;

  bool get hasData => data != null;

  bool get hasError => error != null;

  @override
  List<Object?> get props => [data, error, inProgress];

  Widget buildWhen({
    Widget Function(T? data)? inProgress,
    required Widget Function(T data) onData,
    Widget Function(T? data, Object? error)? onError,
  }) {
    if (hasError) {
      return onError?.call(data, error!) ?? const SizedBox();
    }
    if (hasData && !this.inProgress) {
      return onData(data as T);
    }
    return inProgress?.call(data) ?? const SizedBox();
  }
}
