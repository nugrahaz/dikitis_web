import 'package:dikitis_web/app/constants/constants.dart';
import 'package:dikitis_web/app/models/base_list_response.dart';
import 'package:dikitis_web/app/models/base_object_response.dart';
import 'package:dikitis_web/app/models/information_model.dart';
import 'package:dikitis_web/app/services/remote/api_base_helper.dart';

class InformationService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<BaseObjectResponse> createS(Information data) async {
    final request = await _helper.post(
      url: ApiPath.createInformation,
      body: {
        'information_title': data.information_title,
        'information_description': data.information_description,
      },
    );

    BaseObjectResponse response = BaseObjectResponse<Information>.fromJson(
      request,
      (data) => Information.fromJson(data),
    );

    return BaseObjectResponse(
        data: response.data,
        message: response.message,
        isSuccess: response.isSuccess);
  }

  Future<BaseListResponse<Information>> readS() async {
    final request = await _helper.get(
      url: ApiPath.readInformation,
    );

    var responseData = BaseListResponse<Information>.fromJson(request, (data) {
      List<Information> list =
          data.map((e) => Information.fromJson(e)).toList();
      return list;
    });

    return BaseListResponse(
        data: responseData.data,
        message: responseData.message,
        isSuccess: responseData.isSuccess);
  }

  Future<BaseObjectResponse> updateS(Information data) async {
    final request = await _helper.post(
      url: ApiPath.updateInformation,
      body: {
        'information_id': data.information_id,
        'information_title': data.information_title,
        'information_description': data.information_description,
      },
    );

    BaseObjectResponse response = BaseObjectResponse<Information>.fromJson(
      request,
      (data) => Information.fromJson(data),
    );

    return BaseObjectResponse(
        data: response.data,
        message: response.message,
        isSuccess: response.isSuccess);
  }

  Future<BaseObjectResponse> deleteS(String codeSelected) async {
    final request = await _helper.post(
      url: ApiPath.deleteInformation,
      body: {
        'information_id': codeSelected,
      },
    );

    BaseObjectResponse response = BaseObjectResponse<Information>.fromJson(
      request,
      (data) => Information.fromJson(data),
    );

    return BaseObjectResponse(
        data: response.data,
        message: response.message,
        isSuccess: response.isSuccess);
  }
}
