// ignore_for_file: non_constant_identifier_names

class Symptom {
  String symptom_id, symptom_name, symptom_description;

  Symptom({
    this.symptom_id = "",
    this.symptom_name = "",
    this.symptom_description = "",
  });

  factory Symptom.fromJson(Map<String, dynamic> json) => Symptom(
        symptom_id: json["symptom_id"],
        symptom_name: json["symptom_name"],
        symptom_description: json["symptom_description"],
      );
}
