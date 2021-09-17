import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:testtaskomisoft/bloc/main_bloc/main_bloc.dart';
import 'package:testtaskomisoft/bloc/main_bloc/main_event.dart';
import 'package:testtaskomisoft/data/user_repository.dart';

import 'main_route.dart';

class MainParentRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) =>
          MainBloc(Injector().get<UserRepository>())..add(LoadingEvent()),
      child: MainRoute(),
    );
  }
}
