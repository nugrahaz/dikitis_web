part of "utils.dart";

extension BoolParsing on String {
  bool parseBool() {
    if ((this).toLowerCase() == 'true') {
      return true;
    } else {
      return false;
    }
  }
}

extension DateTimeFormat on DateTime {
  String format() {
    DateFormat dateFormat = DateFormat("hh:mm a");
    String string = dateFormat.format(this);

    return string;
  }
}
