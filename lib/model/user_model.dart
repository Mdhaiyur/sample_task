import 'dart:typed_data';

class UserModel {
  String firstName;
  String lastName;
  String email;
  String mobileNumber;
  Uint8List profilePhoto;
  String gender;
  String education;
  int yearOfPassing;
  String university;
  int grade;
  int yearOfExperience;
  String designation;
  String domain;
  String address;
  String locality;
  int zipcode;
  String city;
  String state;

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.mobileNumber,
      required this.profilePhoto,
      required this.gender,
      required this.education,
      required this.yearOfPassing,
      required this.university,
      required this.grade,
      required this.yearOfExperience,
      required this.designation,
      required this.domain,
      required this.address,
      required this.locality,
      required this.zipcode,
      required this.city,
      required this.state});
}
