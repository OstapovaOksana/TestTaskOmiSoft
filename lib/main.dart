import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:testtaskomisoft/ui/main_parent_route.dart';

import 'injection/home_module.dart';

void main() {
  HomeModule().initialise(Injector());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainParentRoute(),
    );
  }
}
