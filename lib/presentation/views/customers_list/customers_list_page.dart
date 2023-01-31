import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mc_crud_test/domain/entities/customer_model.dart';
import 'package:mc_crud_test/presentation/views/customers_list/controller/customer_controller.dart';
import 'package:mc_crud_test/presentation/views/customers_list/pages/customer_add_page.dart';
import 'package:mc_crud_test/presentation/widgets/customer_card.dart';

class CustomerListPage extends StatelessWidget {
  // late CustomerController controller;
   CustomerListPage({Key? key}) : super(key: key){
    //  controller = Get.find();
   }
  var date = DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    return GetX<CustomerController>(
      initState: (state)async {
        
      },
      builder: (controller) {
        return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
                centerTitle: true,
                title: const Text('Crud App'),
              ),
        floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                   Navigator.of(context).push
                   (
                     MaterialPageRoute(
                     builder:(_){
                       return CustomerAddPage();
                     }
                     )
                   );
                },
        ),
        body: Container(
                padding: const EdgeInsets.all(5),
                child: RefreshIndicator(
                  onRefresh: ()async {
                    await controller.queryDB();
                  },
                  child: ListView.builder(
                    itemCount: controller.customersList.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    itemBuilder: ((context, index) {
                      return CustomerCard(
                        onTap: () {
                          
                        },
                        onDelete: (){
                          Get.defaultDialog(
                                    title: 'Delete Customer',
                                    middleText:"${controller.customersList[index].firstName!} ${controller.customersList[index].lastName!}",
                                    onCancel: () => Get.back(),
                                    confirmTextColor: Colors.white,
                                    onConfirm: () {
                                       controller.customersList.removeAt(index);
                                       Get.back();
                                });
                        },
                        onEdit: (){},
                        text: "${controller.customersList[index].firstName} ${controller.customersList[index].lastName}",
                      );
                    })
                    ),
                ),
              )
      );
      },
    );
  }
}