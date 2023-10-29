
import 'package:blog_assesment/res/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme  {

 static  ThemeData getAppTheme() {
    return ThemeData(  
      primarySwatch: AppColor.getPrimarySwatchColor(),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
    );
  }

 

 
}
