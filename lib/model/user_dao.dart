
import 'package:sample_task/database/dao.dart';
import 'package:sample_task/model/user_model.dart';

class UserDao implements Dao<UserModel> {
  final tableName = 'user';
  final _firstName = 'firstName';
  final _lastName = 'lastName';
  final _email = 'email';
  final _mobileNumber = 'mobileNumber';
  final _profilePhoto = 'profilePhoto';
  final _gender = 'gender';
  final _password = 'password';
  final _education = 'education';
  final _yearOfPassing = 'yearOfPassing';
  final _university = 'university';
  final _grade = 'grade';
  final _yearOfExperience = 'yearOfExperience';
  final _designation = 'designation';
  final _domain = 'domain';
  final _address = 'address';
  final _locality = 'locality';
  final _zipcode = 'zipcode';
  final _city = 'city';
  final _state = 'state';


  @override
  String get createTableQuery => "CREATE TABLE $tableName("
      " $_firstName TEXT,"
      " $_lastName TEXT,"
      " $_email TEXT,"
      " $_mobileNumber TEXT,"
      " $_profilePhoto BLOB,"
      " $_gender TEXT,"
      " $_password TEXT,"
      " $_education TEXT,"
      " $_yearOfPassing TEXT,"
      " $_university TEXT,"
      " $_grade TEXT,"
      " $_yearOfExperience TEXT,"
      " $_designation TEXT,"
      " $_domain TEXT,"
      " $_address TEXT,"
      " $_locality TEXT,"
      " $_zipcode TEXT,"
      " $_city TEXT,"
      " $_state TEXT)";

  @override
  UserModel fromMap(Map<dynamic, dynamic> query) {
    UserModel user = UserModel();
    user.firstName = query[_firstName];
    user.lastName = query[_lastName];
    user.email = query[_email];
    user.mobileNumber = query[_mobileNumber];
    user.profilePhoto = query[_profilePhoto];
    user.gender = query[_gender];
    user.password = query[_password];
    user.education = query[_education];
    user.yearOfPassing = query[_yearOfPassing];
    user.university = query[_university];
    user.grade = query[_grade];
    user.yearOfExperience = query[_yearOfExperience];
    user.designation = query[_designation];
    user.domain= query[_domain];
    user.address= query[_address];
    user.locality= query[_locality];
    user.zipcode=query[_zipcode];
    user.city=query[_city];
    user.state=query[_state];
    return user;
  }

  @override
  Map<String, dynamic> toMap(UserModel object) {
    return <String, dynamic>{
      _firstName: object.firstName,
      _lastName: object.lastName,
      _email: object.email,
      _mobileNumber: object.mobileNumber,
      _profilePhoto: object.profilePhoto,
      _gender: object.gender,
      _password: object.password,
      _education: object.education,
      _yearOfPassing: object.yearOfPassing,
      _university: object.university,
      _grade: object.grade,
      _yearOfExperience: object.yearOfExperience,
      _designation: object.designation,
      _domain: object.domain,
      _address: object.address,
      _locality: object.locality,
      _zipcode: object.zipcode,
      _city: object.city,
      _state: object.state
    };
  }

  @override
  List<UserModel> fromList(List<Map<dynamic, dynamic>> query) {
    List<UserModel> users = [];
    for (Map map in query) {
      users.add(fromMap(map));
    }
    return users;
  }
}