import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtaskomisoft/bloc/main_bloc/main_event.dart';
import 'package:testtaskomisoft/bloc/main_bloc/main_state.dart';
import 'package:testtaskomisoft/data/user_repository.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  UserRepository userRepository;

  MainBloc(this.userRepository) : super(RouteLoadingState());

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is LoadingEvent) {
      String? token = await userRepository.getToken();
      if (token != null) {
        yield AuthenticatedUserState();
      } else {
        yield UnAuthenticatedUserState();
      }
    }
  }
}
