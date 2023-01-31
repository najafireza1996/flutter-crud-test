import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mc_crud_test/common/helper/get_it_helper.dart';
import 'package:mc_crud_test/common/helper/getx_controller_binding_helper.dart';
import 'package:mc_crud_test/common/theme/dark_theme.dart';
import 'package:mc_crud_test/common/theme/light_theme.dart';
import 'package:mc_crud_test/presentation/views/customers_list/controller/customer_controller.dart';
import 'package:mc_crud_test/presentation/views/customers_list/customers_list_page.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  GetItHelper().initialize();
  GetxControllerBindingHelper().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Crud App',
      debugShowCheckedModeBanner: false,
      theme: LightTheme(),
      darkTheme: DarkTheme(),
      themeMode: ThemeMode.system,
      initialBinding: GetxControllerBindingHelper(),
      home: CustomerListPage(),
    );
  }
}