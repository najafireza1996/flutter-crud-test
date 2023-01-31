import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mc_crud_test/common/theme/colors.dart/color_palette.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({Key? key,required this.hintText,this.inputFormatters,this.validator,this.scrollController,required this.textEditingController}) : super(key: key);

  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final ScrollController? scrollController;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.all(15),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: inputFormatters,
                scrollController: scrollController,
                controller: textEditingController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                fillColor: ColorPalette().onPrimary, 
                hintText: hintText,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide:  BorderSide(color: ColorPalette().blue, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorPalette().error, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),                                                                                                                        
                ),
                autofocus: true,
                validator: validator,
              ),            
            );
  }
}