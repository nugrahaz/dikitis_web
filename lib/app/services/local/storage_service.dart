// ignore_for_file: unused_import

import 'package:dikitis_web/app/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageServices {
  var box = GetStorage();
  final String _idKey = "id";
  final String _fullnameKey = "fulname";
  final String _emailKey = "email";
  final String _photoUrlKey = "photoUrl";
  final String _roleKey = "role";
  final String _isLoggedKey = "isLogged";
  final String _addressKey = "address";

  Future<void> setUserLogged(bool status) async {
    box.write(_isLoggedKey, status);
  }

  bool getUserLogged() {
    bool status = box.read(_isLoggedKey) ?? false;
    return status;
  }

  //menandai page telah dilihat
  Future<void> pageHasSeen(String page) async {
    box.writeIfNull(page, true);
  }

  //check jika sudah dilihat
  Future<bool?> checkSeen(String page) async {
    var status = await box.read(page) ?? false;
    return status;
  }

  User getUserData() {
    Doctor userData = Doctor(
      id: box.read(_idKey),
      doctor_fullname: box.read(_fullnameKey),
      email: box.read(_emailKey),
      role: box.read(_roleKey),
    );

    return userData;
  }

  Future<void> setDataUser({required User user}) async {
    box.write(_idKey, user.user_id);
    box.write(_emailKey, user.user_email);
    box.write(_roleKey, user.user_role);
  }

  Future<void> setDataDoctor({required Doctor doctor}) async {
    box.write(_idKey, doctor.user_id);
    box.write(_emailKey, doctor.user_email);
    box.write(_roleKey, doctor.user_role ?? "doctor");
    //
    box.write(_fullnameKey, doctor.doctor_fullname);
    box.write(_addressKey, doctor.doctor_address ?? "");
  }

  Future<void> setID(String id) async {
    box.write(_idKey, id);
  }

  String getId() {
    return box.read(_idKey) ?? "";
  }

  Future<void> setFullname(String fullname) async {
    box.write(_fullnameKey, fullname);
  }

  String getFullname() {
    return box.read(_fullnameKey) ?? "";
  }

  Future<void> setEmail(String email) async {
    box.write(_emailKey, email);
  }

  String getEmail() {
    return box.read(_emailKey);
  }

  Future<void> readData() async {
    print("=== read data ===");

    print("id :${box.read(_idKey)}");
    print("email :${box.read(_emailKey)}");
    print("role :${box.read(_roleKey)}");

    print("fullname :${box.read(_fullnameKey)}");
    print("=== read data ===");
  }

  Future<void> logout() async {
    box.remove(_idKey);
    box.remove(_emailKey);
    box.remove(_roleKey);

    box.remove(_fullnameKey);
    box.remove(_photoUrlKey);
    box.write(_isLoggedKey, false);
  }
}
