part of '../constants.dart';

class AppRoutes {
  static const initial = '/';
  static const authenticationScreen = '/authentication';
  static const emailVerificationScreen = '/emailVerification';
  static const homeScreen = '/home';
  static const diseaseScreen = '/disease';
  static const symptomScreen = '/symptom';
  static const ruleScreen = '/rule';
  static const informationScreen = '/information';

  static final getPages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: AppRoutes.authenticationScreen,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
        name: AppRoutes.homeScreen,
        page: () => HomePage(),
        binding: HomeBinding(),
        middlewares: [RouteGuard()]),
    GetPage(
      name: AppRoutes.emailVerificationScreen,
      page: () => EmailVerificationPage(),
      binding: EmailVerificationBinding(),
    ),
    GetPage(
        name: AppRoutes.diseaseScreen,
        page: () => DiseasePage(),
        binding: DiseaseBinding(),
        middlewares: [RouteGuard()]),
    GetPage(
        name: AppRoutes.symptomScreen,
        page: () => SymptomPage(),
        binding: SymptomBinding(),
        middlewares: [RouteGuard()]),
    GetPage(
        name: AppRoutes.ruleScreen,
        page: () => RulePage(),
        bindings: [RuleBinding(), DiseaseBinding(), SymptomBinding()],
        middlewares: [RouteGuard()]),
    GetPage(
        name: AppRoutes.informationScreen,
        page: () => InformationPage(),
        binding: InformationBinding(),
        middlewares: [RouteGuard()]),
  ];
}
