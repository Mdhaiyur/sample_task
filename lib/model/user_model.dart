import 'dart:typed_data';
import 'package:floor/floor.dart';

@entity
class UserModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  Uint8List? profilePhoto;
  String? password;
  String? gender;
  String? education;
  String? yearOfPassing;
  String? university;
  String? grade;
  String? yearOfExperience;
  String? designation;
  String? domain;
  String? address;
  String? locality;
  String? zipcode;
  String? city;
  String? state;

  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.mobileNumber,
      this.profilePhoto,
      this.password,
      this.gender,
      this.education,
      this.yearOfPassing,
      this.university,
      this.grade,
      this.yearOfExperience,
      this.designation,
      this.domain,
      this.address,
      this.locality,
      this.zipcode,
      this.city,
      this.state});
}
