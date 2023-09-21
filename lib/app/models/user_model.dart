// ignore_for_file: non_constant_identifier_names

class User {
  String? user_id;
  String? user_email;
  String? user_password;
  String? user_role;
  int? user_is_active;

  User({
    this.user_id,
    this.user_email,
    this.user_password,
    this.user_role,
    this.user_is_active,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        user_id: json["user_id"] ?? "none",
        user_email: json["user_email"] ?? "none",
        user_password: json["user_password"] ?? "none",
        user_role: json["user_role"] ?? "doctor",
        user_is_active: int.parse(json["user_is_active"].toString()),
      );
}

class Patient extends User {
  String? patient_fullname;
  String? patient_photo_url;
  String? patient_address;

  Patient({
    String id = "",
    String email = "",
    String password = "",
    String role = "patient",
    int isActive = 0,
    //
    this.patient_fullname = "",
    this.patient_photo_url = "",
    this.patient_address = "",
  }) : super(
            user_id: id,
            user_email: email,
            user_password: password,
            user_role: role,
            user_is_active: isActive);

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["user_id"],
        email: json["user_email"] ?? "",
        password: json["user_password"] ?? "",
        role: json["user_role"] ?? "doctor",
        isActive: int.parse(json["user_is_active"].toString()),
        //
        patient_fullname: json["patient_fullname"] ?? "",
        patient_photo_url: json["patient_photo_url"] ?? "",
        patient_address: json["patient_address"] ?? "",
      );
}

class Doctor extends User {
  String? doctor_fullname;
  String? doctor_address;

  Doctor({
    String id = "",
    String email = "",
    String password = "",
    String role = "doctor",
    int isActive = 0,
    //
    this.doctor_fullname = "",
    this.doctor_address = "",
  }) : super(
            user_id: id,
            user_email: email,
            user_password: password,
            user_role: role,
            user_is_active: isActive);

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["user_id"] ?? "",
        email: json["user_email"] ?? "",
        password: json["user_password"] ?? "",
        role: json["user_role"] ?? "doctor",
        isActive: int.parse(json["user_is_active"]),
        //
        doctor_fullname: json["doctor_fullname"] ?? "",
        doctor_address: json["doctor_address"] ?? "",
      );
}
