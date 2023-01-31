import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mc_crud_test/infrastructure/repositories/interfaces/iLocal_db_handler.dart';
import 'package:mc_crud_test/presentation/views/customers_list/controller/customer_controller.dart';


class GetxControllerBindingHelper implements Bindings {
  @override
  void dependencies() {
   var controller = Get.put(CustomerController(localDbHandler: GetIt.instance.get<ILocalDbHandler>()));
  }
}
