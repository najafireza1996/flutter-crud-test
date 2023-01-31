import 'package:flutter/material.dart';
import 'package:mc_crud_test/common/theme/colors.dart/color_palette.dart';

ThemeData DarkTheme(){
  final ThemeData theme = ThemeData.dark();
  return theme.copyWith(
    primaryColor: ColorPalette().primary,
  );
}