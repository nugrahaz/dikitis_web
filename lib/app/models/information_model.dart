// ignore_for_file: non_constant_identifier_names

class Information {
  final String? information_id;
  final String? information_title;
  final String? information_description;

  const Information({
    this.information_id = "",
    this.information_title = "",
    this.information_description = "",
  });

  factory Information.fromJson(Map<String, dynamic> json) => Information(
        information_id: json["information_id"],
        information_title: json["information_title"],
        information_description: json["information_description"],
      );
}

// class ReturnValueInformation {
//   final String status;
//   final String message;
//   List<Information>? data = <Information>[];
//
//   ReturnValueInformation({
//     this.status = "",
//     this.message = "",
//     this.data,
//   });
//
//   factory ReturnValueInformation.fromJson(Map<String, dynamic> json) =>
//       ReturnValueInformation(
//         status: json["status"],
//         message: json["message"],
//         data: List<Information>.from(
//             json["data"].map((x) => Information.fromJson(x))),
//       );
// }
