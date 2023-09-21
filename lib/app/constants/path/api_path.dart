part of '../constants.dart';

class ApiPath {
  //flutter build web --web-renderer html

  // Database Details
  // $hostname = 'localhost';
  // nama database //
  // $dbname = 'diki2466_db_dikitis';
  // akun database //
  // $username = 'diki2466_user_dikitis';
  // $password = 'B4716ur4m15*PW';

  static const baseUrl = "https://dikitis.online/api/"; //http://dikitis.online

  //User
  static var login = baseUrl + "user/login.php";
  static var registration = baseUrl + "user/registration_doctor.php";
  static var readUserDoctor = baseUrl + "user/read_user_doctor.php";
  static var readUserPatient = baseUrl + "user/read_user_patient.php";
  static var updateAccount = baseUrl + "user/update_data_user.php";
  static var updatePasswordAccount = baseUrl + "user/update_password_user.php";

  //Symptom
  static var createDataSymptom = baseUrl + "symptom/create_symptom.php";
  static var readDataSymptom = baseUrl + "symptom/read_symptom.php";
  static var updateDataSymptom = baseUrl + "symptom/update_symptom.php";
  static var deleteDataSymptom = baseUrl + "symptom/delete_symptom.php";

  //Disease
  static var createTypeDisease = baseUrl + "disease/create_type_disease.php";
  static var readTypeDisease = baseUrl + "disease/read_type_disease.php";
  static var updateTypeDisease = baseUrl + "disease/update_type_disease.php";
  static var deleteTypeDisease = baseUrl + "disease/delete_type_disease.php";

  //Rule
  static var createDataRule = baseUrl + "rule/create_rule.php";
  static var readDataRule = baseUrl + "rule/read_rule.php";
  static var deleteDataRule = baseUrl + "rule/delete_rule.php";

  //Information
  static var createInformation = baseUrl + "information/create_information.php";
  static var readInformation = baseUrl + "information/read_information.php";
  static var updateInformation = baseUrl + "information/update_information.php";
  static var deleteInformation = baseUrl + "information/delete_information.php";

  //Image Storage
  static var imageStorage = baseUrl + "images_storage/";

  //User Verification
  static var readVerification =
      baseUrl + "verification_user/read_verification.php";
  static var createVerification =
      baseUrl + "verification_user/create_verification_doctor.php";
  static var updateVerification =
      baseUrl + "verification_user/update_verification.php";
  static var sendVerification =
      baseUrl + "verification_user/send_verification.php";

  static var createDataMessage = baseUrl + "message/create_message.php";
  static var readDataMessage = baseUrl + "message/read_message.php";
}
