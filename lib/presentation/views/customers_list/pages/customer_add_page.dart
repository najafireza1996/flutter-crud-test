import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mc_crud_test/common/helper/validator_helper.dart';
import 'package:mc_crud_test/common/theme/colors.dart/color_palette.dart';
import 'package:mc_crud_test/domain/entities/customer_model.dart';
import 'package:mc_crud_test/presentation/views/customers_list/controller/customer_controller.dart';
import 'package:mc_crud_test/presentation/widgets/custom_textfield.dart';

class CustomerAddPage extends StatelessWidget {
  CustomerAddPage({Key? key}) : super(key: key);

  ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false, 
        appBar: AppBar(
                centerTitle: true,
                title: const Text('Add Customer'),
              ),
        body:GetX<CustomerController>(
          builder: (controller) {
            return Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left:10, right: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 5),
                child: SingleChildScrollView(
                  reverse: true, 
                  child: Form(
                      key: _formKey,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5,),
                          CustomTextfield(
                            hintText: "First Name",
                            textEditingController: controller.firstNameController,
                            validator: (value) {
                              if(!value!.isValidName){
                                return 'Enter valid name';
                              }else{
                                return null;
                              }
                            
                            },
                            ),
                          CustomTextfield(
                            hintText: "Last Name",
                            textEditingController:  controller.lastNameController,
                            validator: (value) {
                              if(!value!.isValidName){
                                return 'Enter valid name';
                              }else{
                                return null;
                              }
                            
                            },
                            ),
                          CustomTextfield(
                            hintText: "Phone Number",
                            textEditingController:  controller.phoneNumberController,
                            validator: (value) {
                              if(!value!.isValidName){
                                return 'Enter valid phone';
                              }else{
                                return null;
                              }
                            
                            },
                            ),
                          CustomTextfield(
                            hintText: "Date of Birth",
                            textEditingController: controller.dateOfBirthController,
                            validator: (value) {
                              if(!value!.isValidName){
                                return 'Enter valid date like: 2016/12/28';
                              }else{
                                return null;
                              }
                            
                            },
                            ),
                          CustomTextfield(
                            hintText: "Bank Account Number",
                            textEditingController:  controller.bankAccountNumberController,
                            validator: (value) {
                              if(!value!.isValidName){
                                return 'Enter valid bank account number';
                              }else{
                                return null;
                              }
                            },
                            ),
                          Center(
                            child: ElevatedButton(
                            onPressed: ()async{
                                print(controller.customers.value);
                              if (_formKey.currentState!.validate()) {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(content: Text('Processing Data')),
                                // );
                                controller.insertDB();
                                await controller.queryDB();
                                Navigator.pop(context);
                              }
                            }, 
                            child: const Text("Add new customer")
                            ),
                          ),
                          Text(controller.customers.value.length.toString())
                        ]
                        ),
                    ),
                ),
              )
            ],
          );
          },
        )
      ),
    );
  }
}