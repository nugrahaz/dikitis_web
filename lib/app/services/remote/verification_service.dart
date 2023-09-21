// class VerifikasiServices {
//   VerifikasiUser user =
//       VerifikasiUser(kodeVerifikasi: 000000, email: "null", idVerifikasi: 0);
//
//   Future<BaseObjectResponse<VerifikasiUser>> createCodeVerification(
//       VerifikasiUser verifikasiUser) async {
//     try {
//       final response = await http.post(
//         Uri.parse(ApiPath.baseUrl.toString() +
//             ApiPath.createDataVerification.toString()),
//         body: {
//           'email': verifikasiUser.email,
//           'kode_verifikasi': verifikasiUser.kodeVerifikasi.toString(),
//         },
//       );
//
//       var resp = json.decode(response.body);
//
//       var respStatus = resp["status"];
//       var respMessage = resp["message"];
//
//       if (response.statusCode == 200) {
//         if (respStatus.toString() == "failed") {
//           return BaseObjectResponse(
//               data: user, message: respMessage, isSuccess: respStatus);
//         } else {
//           if (kDebugMode) {
//             print("berhasil");
//           }
//           return BaseObjectResponse(
//               message: respMessage, isSuccess: respStatus);
//         }
//       } else {
//         throw Exception('Failed to load core verification');
//       }
//     } catch (error) {
//       if (kDebugMode) {
//         print(error.toString());
//       }
//       return BaseObjectResponse(message: error.toString());
//     }
//   }
//
//   Future<ApiReturnValue> userRegistration(User user) async {
//     final response = await http.post(
//         Uri.parse(ApiServices.baseUrl.toString() +
//             ApiServices.registration.toString()),
//         body: {
//           'fullname': user.fullname,
//           'email': user.email,
//           'password': user.password,
//           'photoUrl': user.photoUrl,
//           'role': user.role,
//           'isActive': user.isActive.toString()
//         });
//
//     var resp = json.decode(response.body);
//     var respStatus = resp["status"];
//     var respMessage = resp["message"];
//
//     if (response.statusCode == 200) {
//       return ApiReturnValue(message: respMessage, status: respStatus);
//     } else {
//       throw Exception();
//     }
//   }
//
//   Future<ApiReturnValue> userVerification(String email) async {
//     final response = await http.post(
//         Uri.parse(ApiServices.baseUrl.toString() +
//             ApiServices.verification.toString()),
//         body: {
//           'email': email,
//         });
//
//     print(response.body);
//     var resp = json.decode(response.body);
//     print(resp);
//
//     var respStatus = resp["status"];
//     var respMessage = resp["message"];
//
//     if (response.statusCode == 200) {
//       return ApiReturnValue(status: respStatus, message: respMessage);
//     } else {
//       throw Exception();
//     }
//   }
//
//   Future imageUploadS({required String email, required File file}) async {
//     print(email);
//     print(file.path);
//     var request = http.MultipartRequest(
//         'POST',
//         Uri.parse(ApiServices.baseUrl.toString() +
//             ApiServices.uploadImage.toString()));
//     request.fields['email'] = email;
//
//     var pic = await http.MultipartFile.fromPath("image", file.path);
//     request.files.add(pic);
//
//     var response = await request.send();
//     if (response.statusCode == 200) {
//       showSnackbar(
//           "Foto Profil ditambahkan", "Berhasil menambahkan foto profil");
//       GetStorage box = GetStorage();
//       await box.remove("photoUrl");
//       await box.write("photoUrl", "img_" + email + ".jpg");
//       print(box.read("photoUrl"));
//       Get.offAllNamed(AppRoutes.mainScreen);
//     } else {
//       showSnackbar("Foto gagal ditambahkan", "Gagal menambahkan foto profil");
//     }
//     return response.statusCode;
//   }
// }

import 'package:dikitis_web/app/constants/constants.dart';
import 'package:dikitis_web/app/models/base_list_response.dart';
import 'package:dikitis_web/app/models/base_object_response.dart';
import 'package:dikitis_web/app/models/email_verification_model.dart';
import 'package:dikitis_web/app/services/remote/api_base_helper.dart';

class VerificationService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<BaseObjectResponse<Verification>> createCodeVerificationS(
      Verification verificationUser) async {
    try {
      final response = await _helper.post(
        url: ApiPath.createVerification,
        body: {
          'user_email': verificationUser.email,
          'verification_code': verificationUser.codeVerification.toString(),
        },
      );

      BaseObjectResponse basicResponse =
          BaseObjectResponse<Verification>.fromJson(
        response,
        (data) => Verification.fromJson(data),
      );

      return BaseObjectResponse(
        data: basicResponse.data,
        message: basicResponse.message,
        isSuccess: basicResponse.isSuccess,
      );
    } catch (error) {
      return BaseObjectResponse(message: error.toString());
    }
  }

  Future<BaseListResponse<Verification>> readDataVerificationS() async {
    final request = await _helper.get(
      url: ApiPath.readVerification,
    );

    var responseData = BaseListResponse<Verification>.fromJson(request, (data) {
      List<Verification> list =
          data.map((e) => Verification.fromJson(e)).toList();
      return list;
    });

    return BaseListResponse(
        data: responseData.data,
        message: responseData.message,
        isSuccess: responseData.isSuccess);
  }

  Future<BaseObjectResponse> verificationCodeRev(String email) async {
    final response =
        await _helper.post(url: ApiPath.updateVerification.toString(), body: {
      'user_email': email,
    });

    var basicResponse = BaseObjectResponse<Verification>.fromJson(
        response, (data) => Verification.fromJson(data));

    return BaseObjectResponse(
      isSuccess: basicResponse.isSuccess,
      message: basicResponse.message,
      data: basicResponse.data,
    );
  }

  Future<BaseObjectResponse> sendCodeVerificationS(
      String email, String code) async {
    final response =
        await _helper.post(url: ApiPath.sendVerification.toString(), body: {
      'user_email': email,
      'verification_code': code,
    });

    BaseObjectResponse basicResponse =
        BaseObjectResponse<Verification>.fromJson(
      response,
      (data) => Verification.fromJson(data),
    );

    return BaseObjectResponse(
      isSuccess: basicResponse.isSuccess,
      message: basicResponse.message,
      data: basicResponse.data,
    );
  }
}
