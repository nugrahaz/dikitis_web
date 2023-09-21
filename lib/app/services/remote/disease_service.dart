import 'package:dikitis_web/app/constants/constants.dart';
import 'package:dikitis_web/app/models/base_list_response.dart';
import 'package:dikitis_web/app/models/base_object_response.dart';
import 'package:dikitis_web/app/models/disease_model.dart';
import 'package:dikitis_web/app/services/remote/api_base_helper.dart';

class DiseaseService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<BaseObjectResponse<Disease>> createS(Disease data) async {
    final request = await _helper.post(
      url: ApiPath.createTypeDisease,
      body: {
        'disease_id': data.disease_id,
        'disease_name': data.disease_name,
        'disease_description': data.disease_description,
      },
    );

    BaseObjectResponse<Disease> response = BaseObjectResponse<Disease>.fromJson(
      request,
      (data) => Disease.fromJson(data),
    );

    return BaseObjectResponse(
        data: response.data,
        message: response.message,
        isSuccess: response.isSuccess);
  }

  Future<BaseListResponse<Disease>> readS() async {
    final resp = await _helper.get(
      url: ApiPath.readTypeDisease,
    );

    var responseData = BaseListResponse<Disease>.fromJson(resp, (data) {
      List<Disease> list = data.map((e) => Disease.fromJson(e)).toList();
      return list;
    });

    return BaseListResponse(
        data: responseData.data,
        message: responseData.message,
        isSuccess: responseData.isSuccess);
  }

  Future<BaseObjectResponse<Disease>> updateS(Disease data) async {
    final request = await _helper.post(
      url: ApiPath.updateTypeDisease,
      body: {
        'disease_id': data.disease_id,
        'disease_name': data.disease_name,
        'disease_description': data.disease_description,
      },
    );

    BaseObjectResponse response = BaseObjectResponse<Disease>.fromJson(
      request,
      (data) => Disease.fromJson(data),
    );

    return BaseObjectResponse(
        data: response.data,
        message: response.message,
        isSuccess: response.isSuccess);
  }

  Future<BaseObjectResponse<Disease>> deleteS(String idSelected) async {
    final request = await _helper.post(
      url: ApiPath.deleteTypeDisease,
      body: {
        'disease_id': idSelected,
      },
    );

    BaseObjectResponse response = BaseObjectResponse<Disease>.fromJson(
      request,
      (data) => Disease.fromJson(data),
    );

    return BaseObjectResponse(
        data: response.data,
        message: response.message,
        isSuccess: response.isSuccess);
  }
}
