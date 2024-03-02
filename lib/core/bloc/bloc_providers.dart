import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/settings/presentation/bloc/locale_cubit.dart';
import '../../src/settings/presentation/bloc/theme_bloc.dart';

class AppBlocProviders extends StatelessWidget {
  final Widget child;
  const AppBlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      child: child,
      providers: [
        BlocProvider<LocaleCubit>(
          create: (BuildContext context) => LocaleCubit()..getLanguageData(),
        ),
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc()..getThemeData(),
        ),
      ],
    );
  }
}
