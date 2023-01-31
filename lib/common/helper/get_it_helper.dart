

import 'package:get_it/get_it.dart';
import 'package:mc_crud_test/infrastructure/repositories/interfaces/iLocal_db_handler.dart';
import 'package:mc_crud_test/infrastructure/repositories/local/local_db_handler.dart';

class GetItHelper {
  GetIt getIt = GetIt.instance;
  Future<void> initialize() async {
    //repository local
    
   var dbHelper =  getIt.registerSingleton<ILocalDbHandler>(LocalDbHandler());
   print("getIt has been initialized...");
   await getIt.get<ILocalDbHandler>().init();
   print("local db has been initialized...");
  }
}
