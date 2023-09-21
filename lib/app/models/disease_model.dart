// ignore_for_file: non_constant_identifier_names

class Disease {
  String? disease_id, disease_name, disease_description;

  Disease({
    this.disease_id = "",
    this.disease_name = "",
    this.disease_description = "",
  });

  factory Disease.fromJson(Map<String, dynamic> json) => Disease(
        disease_id: json["disease_id"],
        disease_name: json["disease_name"],
        disease_description: json["disease_description"],
      );
}
