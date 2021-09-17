import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:testtaskomisoft/bloc/home_bloc/home_bloc.dart';
import 'package:testtaskomisoft/data/user_repository.dart';

import 'home_route.dart';

class HomeParentRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(Injector().get<UserRepository>()),
      child: HomeRoute(),
    );
  }
}
