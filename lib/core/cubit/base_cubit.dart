import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_state.dart';

abstract base class BaseCubit<S extends BaseState> extends Cubit<S>
    implements StateStreamableSource<S> {
  BaseCubit(super.initialState) {
    onBindingCreated();
  }

  void safeEmit(S state) {
    if (!isClosed) {
      emit(state);
    }
  }

  @mustCallSuper
  void onBindingCreated() {}
}
