import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:testtaskomisoft/data/user_repository.dart';

class HomeModule {
  Injector initialise(Injector injector) {
    injector.map((injector) => UserRepository(), isSingleton: true);

    return injector;
  }
}
