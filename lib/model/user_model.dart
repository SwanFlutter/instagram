// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  final int? id;
  final String? fullName;
  final String? email;
  final String? picProfile;
  final String? password;
  final bool? success;
  final String? message;
  final Map<String, dynamic>? data;
  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.picProfile,
    this.password,
    this.success,
    this.message,
    this.data,
  });

  Future<bool> checkInternet() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.ethernet) ||
        connectivityResult.contains(ConnectivityResult.vpn) ||
        connectivityResult.contains(ConnectivityResult.other)) {
      return true;
    } else {
      return false;
    }
  }

  UserModel copyWith({
    int? id,
    String? fullName,
    String? email,
    String? picProfile,
    String? password,
    bool? success,
    String? message,
    Map<String, dynamic>? data,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      picProfile: picProfile ?? this.picProfile,
      password: password ?? this.password,
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'email': email,
      'picProfile': picProfile,
      'password': password,
      'success': success,
      'message': message,
      'data': data,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      picProfile:
          map['picProfile'] != null ? map['picProfile'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      success: map['success'] != null ? map['success'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? Map<String, dynamic>.from((map['data'] as Map<String, dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, email: $email, picProfile: $picProfile, password: $password, success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.fullName == fullName &&
        other.email == email &&
        other.picProfile == picProfile &&
        other.password == password &&
        other.success == success &&
        other.message == message &&
        mapEquals(other.data, data);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        email.hashCode ^
        picProfile.hashCode ^
        password.hashCode ^
        success.hashCode ^
        message.hashCode ^
        data.hashCode;
  }
}
