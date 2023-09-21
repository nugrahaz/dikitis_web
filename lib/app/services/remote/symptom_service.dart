import 'package:dikitis_web/app/constants/constants.dart';
import 'package:dikitis_web/app/models/base_list_response.dart';
import 'package:dikitis_web/app/models/base_object_response.dart';
import 'package:dikitis_web/app/models/symptom_model.dart';
import 'package:dikitis_web/app/services/remote/api_base_helper.dart';

class SymptomService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<BaseObjectResponse<Symptom>> createS(Symptom data) async {
    final request = await _helper.post(
      url: ApiPath.createDataSymptom,
      body: {
        'symptom_id': data.symptom_id,
        'symptom_name': data.symptom_name,
        'symptom_description': data.symptom_description,
      },
    );

    BaseObjectResponse response = BaseObjectResponse<Symptom>.fromJson(
      request,
      (data) => Symptom.fromJson(data),
    );

    return BaseObjectResponse(
        data: response.data,
        message: response.message,
        isSuccess: response.isSuccess);
  }

  Future<BaseListResponse<Symptom>> readS() async {
    final resp = await _helper.get(
      url: ApiPath.readDataSymptom,
    );

    var responseData = BaseListResponse<Symptom>.fromJson(resp, (data) {
      List<Symptom> list = data.map((e) => Symptom.fromJson(e)).toList();
      return list;
    });

    return BaseListResponse(
        data: responseData.data,
        message: responseData.message,
        isSuccess: responseData.isSuccess);
  }

  Future<BaseObjectResponse<Symptom>> updateS(Symptom data) async {
    final request = await _helper.post(
      url: ApiPath.updateDataSymptom,
      body: {
        'symptom_id': data.symptom_id,
        'symptom_name': data.symptom_name,
        'symptom_description': data.symptom_description,
      },
    );

    BaseObjectResponse response = BaseObjectResponse<Symptom>.fromJson(
      request,
      (data) => Symptom.fromJson(data),
    );

    return BaseObjectResponse(
        data: response.data,
        message: response.message,
        isSuccess: response.isSuccess);
  }

  Future<BaseObjectResponse<Symptom>> deleteS(String idSelected) async {
    final request = await _helper.post(
      url: ApiPath.deleteDataSymptom,
      body: {'symptom_id': idSelected},
    );

    BaseObjectResponse response = BaseObjectResponse<Symptom>.fromJson(
      request,
      (data) => Symptom.fromJson(data),
    );

    return BaseObjectResponse(
        data: response.data,
        message: response.message,
        isSuccess: response.isSuccess);
  }
}
