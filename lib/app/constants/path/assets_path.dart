part of '../constants.dart';

class AssetsPath {
  static final lottie = _Lotties();
  static final images = _Images();
}

class _Lotties {
  static const path = 'assets/lotties';

  //
  final create = "$path/create.json";
  final delete = "$path/delete.json";
  final exit = "$path/exit.json";
  final listData = "$path/list_data.json";
  final mail = "$path/mail.json";
  final messages = "$path/messages.json";
  final noData = "$path/no_data.json";
  final noInternet = "$path/no_internet.json";
  final sad = "$path/sad.json";
  final selected = "$path/selected.json";
  final settings = "$path/settings.json";

  final update = "$path/update.json";
  final writing = "$path/writing.json";
}

class _Images {
  static const path = 'assets/images';
  final appLogo = '$path/app_logo.png';
  final arrowBack = '$path/arrow_back.png';
  final campusLogo = '$path/campus_logo.png';
  final checklist = '$path/checklist.png';
  final mail = '$path/mail.png';
  final user = '$path/user.png';

  //
  final manageDisease = '$path/manage_disease.png';
  final manageInformation = '$path/manage_information.png';
  final manageRelation = '$path/manage_relation.png';
  final manageSymptom = '$path/manage_symptom.png';
}
