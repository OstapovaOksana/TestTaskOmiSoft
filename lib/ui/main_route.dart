import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtaskomisoft/bloc/main_bloc/main_bloc.dart';
import 'package:testtaskomisoft/bloc/main_bloc/main_state.dart';

import 'home_parent_route.dart';
import 'sign_in_parent_route.dart';

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MainBloc, MainState>(
        listenWhen: (previousState, state) {
          return !_shouldRebuildWidget(state);
        },
        listener: (context, state) {
          if (state is UnAuthenticatedUserState) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) {
              return SignInParentRoute();
            }), (Route<dynamic> route) => false);
          }
        },
        buildWhen: (previousState, state) {
          return _shouldRebuildWidget(state);
        },
        builder: (context, state) {
          if (state is RouteLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AuthenticatedUserState) {
            return HomeParentRoute();
          }
          throw ArgumentError("Main Route Unsupported state from BlocBuilder");
        },
      ),
    );
  }

  bool _shouldRebuildWidget(MainState state) {
    if (state is RouteLoadingState || state is AuthenticatedUserState) {
      return true;
    }
    return false;
  }
}
