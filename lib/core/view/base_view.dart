import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_favorite_books/core/cubit/base_cubit.dart';

typedef Create<C extends StateStreamableSource<Object?>> = C Function();

abstract base class BaseView<C extends BaseCubit<S>, S extends BaseState>
    extends StatefulWidget {
  const BaseView({
    this.cubit,
    this.value,
    super.key,
  })  : assert(
          !(cubit == null && value == null),
          'cubit and value can not be null at the same time!',
        ),
        assert(
          !(cubit != null && value != null),
          'cubit and value can not be assigned at the same time.',
        );
  final Create<C>? cubit;
  final Create<C>? value;

  Widget builder(BuildContext context, C cubit);

  @override
  State<BaseView> createState() => _BaseViewState<C, S>();
}

final class _BaseViewState<C extends BaseCubit<S>, S extends BaseState>
    extends State<BaseView> {
  late final C? cubit;
  late final C? value;

  @override
  void initState() {
    super.initState();

    if (widget.cubit != null) {
      value = null;
      cubit = widget.cubit!() as C;
    } else if (widget.value != null) {
      cubit = null;
      value = widget.value!() as C;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (cubit != null) {
      return BlocProvider<C>(
        create: (context) => cubit!,
        child: Builder(
          builder: (context) {
            return widget.builder(context, context.read<C>());
          },
        ),
      );
    } else {
      return BlocProvider<C>.value(
        value: value!,
        child: Builder(
          builder: (context) {
            return widget.builder(context, context.read<C>());
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
