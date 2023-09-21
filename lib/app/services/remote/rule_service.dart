import 'package:dikitis_web/app/constants/constants.dart';
import 'package:dikitis_web/app/models/rule_model.dart';

import '../../models/base_list_response.dart';
import '../../models/base_object_response.dart';
import 'api_base_helper.dart';

class RuleService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<BaseObjectResponse<Rule>> createS(Rule data) async {
    final request = await _helper.post(
      url: ApiPath.createDataRule,
      body: {
        'disease_id': data.disease_id,
        'symptom_id': data.symptom_id,
      },
    );

    BaseObjectResponse<Rule> response = BaseObjectResponse<Rule>.fromJson(
      request,
      (data) => Rule.fromJson(data),
    );

    return BaseObjectResponse(
        data: response.data,
        message: response.message,
        isSuccess: response.isSuccess);
  }

  Future<BaseListResponse<Rule>> readS() async {
    final resp = await _helper.get(
      url: ApiPath.readDataRule,
    );

    var responseData = BaseListResponse<Rule>.fromJson(resp, (data) {
      List<Rule> list = data.map((e) => Rule.fromJson(e)).toList();
      return list;
    });

    return BaseListResponse(
        data: responseData.data,
        message: responseData.message,
        isSuccess: responseData.isSuccess);
  }

  Future<BaseObjectResponse<Rule>> deleteS(String idSelected) async {
    final request = await _helper.post(
      url: ApiPath.deleteDataRule,
      body: {
        'disease_id': idSelected,
      },
    );

    BaseObjectResponse response = BaseObjectResponse<Rule>.fromJson(
      request,
      (data) => Rule.fromJson(data),
    );

    return BaseObjectResponse(
        data: response.data,
        message: response.message,
        isSuccess: response.isSuccess);
  }
}
