
import 'package:blog_assesment/businessLogics/providers/base_provider.dart';
import 'package:flutter/material.dart';



class AppColor  extends BaseProvider{
  static Color defaultMainColor = Color(0xff0C274F);
  static Color defaultTextColor = Color(0xff000000);
  static Color defaultBgColor =  Color(0xffffffff);
   static Color rdefaultMainColor = Color(0xff0C274F);
  static Color rdefaultTextColor = Color(0xff000000);
  static Color rdefaultBgColor =  Color(0xffffffff);
 static  getPrimarySwatchColor () {
   return MaterialColor(
      defaultMainColor.value,
      <int, Color>{
        50: defaultMainColor,
        100: defaultMainColor,
        200: defaultMainColor,
        300: defaultMainColor,
        400: defaultMainColor,
        500: defaultMainColor, // This is the color for the primary swatch
        600: defaultMainColor,
        700: defaultMainColor,
        800: defaultMainColor,
        900: defaultMainColor,
      },
    );
  }

 static  resetDefault(){
     defaultMainColor = rdefaultMainColor;
   defaultTextColor = rdefaultTextColor;
   defaultBgColor = rdefaultBgColor;
  }
}