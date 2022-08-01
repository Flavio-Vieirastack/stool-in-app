import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stool_in_app_ui/core/constants/routes_constants.dart';
import 'package:stool_in_app_ui/core/permanent_dependencies/permanent_dependencies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: PermanentDependencies.init(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesConstants.splashRoute,
        routes: {
          
        },
      ),
    );
  }
}
