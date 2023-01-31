import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mc_crud_test/common/static/db_const_name.dart';
import 'package:mc_crud_test/domain/entities/customer_model.dart';
import 'package:mc_crud_test/infrastructure/repositories/interfaces/iLocal_db_handler.dart';

class CustomerController extends GetxController{
  CustomerController({required this.localDbHandler});
  
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController bankAccountNumberController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    queryDB();
    super.onInit();
  }
  final ILocalDbHandler localDbHandler;
   
   var customers= <Customer>[].obs;
   var customersList= <Customer>[].obs;

  void insertDB() async {
    try{
       var customer= Customer(firstName: firstNameController.text,
                lastName: lastNameController.text,
                phoneNumber: phoneNumberController.text,
                dateOfBirth: dateOfBirthController.text,
                bankAccountNumber: bankAccountNumberController.text
                );

      final id = await localDbHandler.insert(customer.toMap());
      // final id = await localDbHandler.insert(row);
      debugPrint('inserted row id: $id');
    }catch(e){
      Exception();
    }
  }

  void resetController(){
    customers.clear();
  }
  
  Future<void> queryDB() async {
    try{
      final allRows = await localDbHandler.queryAllRows();
      debugPrint('query all rows:');
      customers.clear();
      customersList.clear();
      customers.value.addAll(allRows.map((data) => Customer.fromMap(data)).toList());
      // for (final row in allRows) {
      //   customers.value.add(
      //     Customer(
      //       id: row[DatabaseNames.columnId],
      //       firstName: row[DatabaseNames.columnFirstName],
      //       lastName: row[DatabaseNames.columnLastName],
      //       phoneNumber: row[DatabaseNames.columnPhoneNumber],
      //       dateOfBirth: row[DatabaseNames.columnDateOfBirth],
      //       bankAccountNumber: row[DatabaseNames.columnBankAccountNumber]
      //     )
      //   );
      //   // debugPrint(row.toString());
      //   // debugPrint("customers \n"+customers.value.toString());
      // }
      // update();
      debugPrint("customers \n"+customers.value.toString());
      customersList.value.addAll(customers.reversed);
    }catch(e){
      Exception();
    }
  }

  void updateDB(Customer customer) async {
    try{
      final rowsAffected = await localDbHandler.update(customer.toMap());
      debugPrint('updated $rowsAffected row(s)');
    }catch(e){
      Exception();
    }
  }

  void deleteDB() async {
    try{
      final id = await localDbHandler.queryRowCount();
      final rowsDeleted = await localDbHandler.delete(id);
      debugPrint('deleted $rowsDeleted row(s): row $id');
    }catch(e){
      Exception();
    }
    
  }

}