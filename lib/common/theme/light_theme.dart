import 'package:flutter/material.dart';
import 'package:mc_crud_test/common/theme/colors.dart/color_palette.dart';

ThemeData LightTheme(){
  final ThemeData theme = ThemeData.light();
  return theme.copyWith(
    primaryColor: ColorPalette().primary,
  );
}