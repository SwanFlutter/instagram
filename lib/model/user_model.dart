// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';

class UserModel {
  int? id;
  String? fullName;
  String? email;
  String? picProfile;
  String? password;
  bool? success;
  String? message;
  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.picProfile,
    this.password,
    this.success,
    this.message,
  });

  static Future<bool> checkInternet() async {
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
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      picProfile: picProfile ?? this.picProfile,
      password: password ?? this.password,
      success: success ?? this.success,
      message: message ?? this.message,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, email: $email, picProfile: $picProfile, password: $password, success: $success, message: $message)';
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
        other.message == message;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        email.hashCode ^
        picProfile.hashCode ^
        password.hashCode ^
        success.hashCode ^
        message.hashCode;
  }
}
