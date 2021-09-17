import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtaskomisoft/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:testtaskomisoft/bloc/sign_in_bloc/sign_in_event.dart';
import 'package:testtaskomisoft/bloc/sign_in_bloc/sign_in_state.dart';
import 'package:testtaskomisoft/data/api_result.dart';
import 'package:testtaskomisoft/ui/home_parent_route.dart';

import 'sign_in_widget.dart';

class SignInRoute extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SignInBloc signInBloc = BlocProvider.of<SignInBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<SignInBloc, SignInState>(
          listenWhen: (previousState, state) {
            return !_shouldRebuildWidget(state);
          },
          listener: (context, state) {
            if (state is SignInSuccessState) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) {
                return HomeParentRoute();
              }), (Route<dynamic> route) => false);
            }
            if (state is SignInFailureState) {
              _handleFailureState(state, signInBloc, context);
            }
          },
          buildWhen: (previousState, state) {
            return _shouldRebuildWidget(state);
          },
          builder: (context, state) {
            if (state is SignInLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            return SignInWidget(
                emailController,
                passwordController,
                (email, password) =>
                    _signInButtonPressed(signInBloc, email, password));
          },
        ),
      ),
    );
  }

  bool _shouldRebuildWidget(SignInState state) {
    if (state is SignInLoadingState || state is SignInInitialState) {
      return true;
    }
    return false;
  }

  void _handleFailureState(state, signInBloc, context) {
    if (state.apiError == ApiError.NO_NETWORK) {
      _handleNetworkError(signInBloc, context);
    } else {
      String errorMessage = _getErrorMessage(state, context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage)));
    }
  }

  void _handleNetworkError(signInBloc, context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 20),
      content: Text('Please check your network connection.'),
      action: SnackBarAction(
        label: 'Retry',
        onPressed: () => signInBloc.add(RetryEvent(
            password: passwordController.text, email: emailController.text)),
      ),
    ));
  }

  String _getErrorMessage(state, context) {
    if (state.validationError == ValidationError.EmptyEmail) {
      return 'Please enter your email.';
    } else if (state.validationError == ValidationError.EmptyPassword) {
      return 'Please enter your password.';
    } else if (state.validationError == ValidationError.InvalidEmail) {
      return 'Your email is invalid';
    }
    return 'Can\'t load data';
  }

  _signInButtonPressed(signInBloc, email, password) {
    signInBloc.add(SignInButtonPressedEvent(email: email, password: password));
  }
}
