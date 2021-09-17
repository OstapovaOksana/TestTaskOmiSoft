import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:testtaskomisoft/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:testtaskomisoft/data/user_repository.dart';

import 'sign_in_route.dart';

class SignInParentRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(Injector().get<UserRepository>()),
      child: SignInRoute(),
    );
  }
}
