import 'package:flutter_web_plugins/flutter_web_plugins.dart';

//remove hash flutter web
void urlConfig() {
  setUrlStrategy(PathUrlStrategy());
}
