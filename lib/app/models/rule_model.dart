// ignore_for_file: non_constant_identifier_names

class Rule {
  String? rule_id, disease_id, symptom_id;

  Rule({
    this.rule_id,
    this.disease_id = "",
    this.symptom_id = "",
  });

  factory Rule.fromJson(Map<String, dynamic> json) => Rule(
        rule_id: json["rule_id"],
        disease_id: json["disease_id"],
        symptom_id: json["symptom_id"],
      );
}
