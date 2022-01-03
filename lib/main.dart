import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sample_task/binding/home_binding.dart';
import 'package:sample_task/view/home/home_page.dart';
import 'package:sample_task/viewmodels/address/address_viewmodel.dart';
import 'package:sample_task/viewmodels/education/education_viewmodel.dart';
import 'package:sample_task/viewmodels/home/home_viewmodel.dart';
import 'package:sample_task/viewmodels/personaldeatails/personaldetails_viewmodel.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PersonalDetailsViewModel(),
        ),
        ChangeNotifierProvider(
            create: (context) => EducationViewModel()
        ),
        ChangeNotifierProvider(
            create: (context) => AddressViewModel()
        ),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialBinding: HomeBinding(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
