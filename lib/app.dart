import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/constants/constants.dart';
import 'app/widgets/no_transition_on_web.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      enableLog: false,
      //
      color: AppStyles.colors.bgDark,
      // theme: AppStyles.theme.defaultTheme,
      defaultTransition: Transition.noTransition,
      //
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.cyan,
        pageTransitionsTheme: NoTransitionsOnWeb(),
      ),
      //
      getPages: AppRoutes.getPages,
      // initialRoute: AppRoutes.authenticationScreen,
      opaqueRoute: false,
      unknownRoute: AppRoutes.getPages.first,
      //
    );
  }
}
