import 'package:dikitis_web/app/constants/constants.dart';
import 'package:dikitis_web/app/models/base_list_response.dart';
import 'package:dikitis_web/app/models/base_object_response.dart';
import 'package:dikitis_web/app/models/user_model.dart';

import 'api_base_helper.dart';

class UserServices {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<BaseObjectResponse<User>> userLogin({required User user}) async {
    //
    final response = await _helper.post(
      url: ApiPath.login.toString(),
      body: {
        'user_email': user.user_email,
        'user_password': user.user_password,
      },
    );

    BaseObjectResponse basicResponse = BaseObjectResponse<User>.fromJson(
      response,
      (data) => User.fromJson(data),
    );

    return BaseObjectResponse(
      isSuccess: basicResponse.isSuccess,
      message: basicResponse.message,
      data: basicResponse.data,
    );
  }

  Future<BaseObjectResponse<User>> userRegistration(
      {required Doctor doctor}) async {
    final response =
        await _helper.post(url: ApiPath.registration.toString(), body: {
      'user_id': doctor.user_id,
      'user_email': doctor.user_email,
      'user_password': doctor.user_password,
      'user_role': doctor.user_role,
      'user_is_active': doctor.user_is_active.toString(),
      //
      'doctor_fullname': doctor.doctor_fullname,
      'doctor_address': doctor.doctor_address,
    });

    BaseObjectResponse<User> basicResponse = BaseObjectResponse<User>.fromJson(
        response, (data) => User.fromJson(data));

    return BaseObjectResponse(
      isSuccess: basicResponse.isSuccess,
      message: basicResponse.message,
      data: basicResponse.data,
    );
  }

  Future<BaseListResponse<Patient>> readDataPatient() async {
    final resp = await _helper.get(
      url: ApiPath.readUserPatient,
    );

    var responseData = BaseListResponse<Patient>.fromJson(resp, (data) {
      List<Patient> list = data.map((e) => Patient.fromJson(e)).toList();
      return list;
    });

    return BaseListResponse(
        data: responseData.data,
        message: responseData.message,
        isSuccess: responseData.isSuccess);
  }

  Future<BaseObjectResponse<Doctor>> readUserData(
      {required String idUser}) async {
    final resp = await _helper.get(
      url: ApiPath.readUserDoctor.toString(),
    );

    BaseListResponse<Doctor> responseData =
        BaseListResponse<Doctor>.fromJson(resp, (data) {
      List<Doctor> list = data.map((e) => Doctor.fromJson(e)).toList();
      return list;
    });
    Doctor dataPatient = Doctor();

    responseData.data?.forEach((Doctor patient) {
      if (patient.user_id!.toLowerCase() == idUser.toLowerCase()) {
        dataPatient = Doctor(
            id: patient.user_id.toString(),
            email: patient.user_email.toString(),
            doctor_fullname: patient.doctor_fullname.toString(),
            doctor_address: patient.doctor_address);
      }
    });

    return BaseObjectResponse(
      data: dataPatient,
      message: responseData.message,
      isSuccess: responseData.isSuccess,
    );
  }
}
