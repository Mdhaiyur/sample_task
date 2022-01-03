import 'package:get/get.dart';
import 'package:sample_task/viewmodels/address/address_viewmodel.dart';
import 'package:sample_task/viewmodels/education/education_viewmodel.dart';
import 'package:sample_task/viewmodels/home/home_viewmodel.dart';
import 'package:sample_task/viewmodels/personaldeatails/personaldetails_viewmodel.dart';

class HomeBinding extends Bindings
{
  @override
  void dependencies() {
  //  Get.lazyPut(() => HomeViewModel());
  //  Get.lazyPut(() => PersonalDetailsViewModel(),fenix: true);
  //  Get.lazyPut(() => EducationViewModel(),fenix: true);
    // Get.lazyPut(() => AddressViewModel(),fenix: true);
  }
}