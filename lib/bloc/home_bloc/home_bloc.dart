import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtaskomisoft/data/user_repository.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  UserRepository userRepository;

  HomeBloc(this.userRepository) : super(InitialHomeState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is SignOutButtonPressedEvent) {
      await userRepository.clearStorage();
    }
  }
}
