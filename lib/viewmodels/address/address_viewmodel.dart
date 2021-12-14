import 'package:get/get.dart';
import 'package:sample_task/data/local/database_provider.dart';
import 'package:sample_task/model/user_model.dart';
import 'package:sample_task/repository/user_repository_imp.dart';
import 'package:sample_task/view/home/home_page.dart';

class AddressViewModel extends GetxController
{

  DatabaseProvider dbProvider = DatabaseProvider.get;
  var currentUser = UserModel();

  var cityList = [
    'Maharashtra',
    'Gujarat',
    'Karnataka',
    'Madhya Pradesh',
    'Delhi',
    'Others'
  ];


  updateCurrentUser(UserModel mUser) {
    currentUser = mUser;
  }

  saveUserAddress(String address, String landmark, String zipcode, String city,
      String state) async {
    currentUser.address = address;
    currentUser.locality = landmark;
    currentUser.zipcode = zipcode;
    currentUser.city = city;
    currentUser.state = state;

    UserRepositoryImp(dbProvider).insert(currentUser);

    Get.offAll(() => HomePage());
  }
}