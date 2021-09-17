import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtaskomisoft/bloc/home_bloc/home_bloc.dart';
import 'package:testtaskomisoft/bloc/home_bloc/home_event.dart';
import 'package:testtaskomisoft/ui/sign_in_parent_route.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                homeBloc.add(SignOutButtonPressedEvent());
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) {
                  return SignInParentRoute();
                }), (Route<dynamic> route) => false);
              },
              child: Text("Вийти")),
        ),
      ),
    );
  }
}
