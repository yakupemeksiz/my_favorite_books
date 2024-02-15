import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_favorite_books/core/cubit/base_cubit.dart';

abstract base class BaseWidget<C extends BaseCubit<S>, S extends BaseState>
    extends StatefulWidget {
  const BaseWidget({super.key});

  Widget build(BuildContext context, C cubit, S state);

  @override
  State<BaseWidget> createState() => _BaseWidgetState<C, S>();
}

final class _BaseWidgetState<C extends BaseCubit<S>, S extends BaseState>
    extends State<BaseWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<C>();
    return BlocBuilder<C, S>(
      builder: (context, state) {
        return widget.build(context, cubit, state);
      },
    );
  }
}
