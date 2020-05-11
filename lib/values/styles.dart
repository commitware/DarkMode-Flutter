import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutternightmode/values/colors.dart';

class Styles {
  //colors

  Styles._();



  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(

      primaryColor: isDarkTheme ? AppColors.codGray : AppColors.teal,

      backgroundColor: isDarkTheme ? AppColors.mineShaft : AppColors.white,

      buttonColor: isDarkTheme ? AppColors.codGray : AppColors.teal,

      highlightColor: isDarkTheme ? AppColors.amaranth : AppColors.amaranth,


      brightness: isDarkTheme ? Brightness.dark : Brightness.light,

      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          buttonColor: isDarkTheme ? AppColors.white : AppColors.doveGray),
    );
  }
}
