import 'package:blog_assesment/businessLogics/providers/base_provider.dart';
import 'package:blog_assesment/data_layer/Storage/storage_helper.dart';
import 'package:flutter/material.dart';

class AppColor extends BaseProvider {
  static Color defaultMainColor = Color(0xff0C274F);
  static Color defaultTextColor = Colors.black;
  static Color defaultBgColor = Colors.white;
  static Color rdefaultMainColor = Color(0xff0C274F);
  static Color rdefaultTextColor = Colors.black;
  static Color rdefaultBgColor = Colors.white;
  static bool isDarkTheme = false;
  changeThemeToDarkMode() {
    if (!isDarkTheme) {
      defaultTextColor = Colors.white;
      defaultBgColor = Colors.black;
      isDarkTheme = true;
    } else {
      defaultTextColor = rdefaultTextColor;
      isDarkTheme = false;
    }

    StorageHelper().setDefaultBgColor();
    StorageHelper().setDefaultTextColor();
    StorageHelper().setThemeMode();
    update();
  }

  updateDefaultMainColor(Color? color) {
    if (color != null) {
      defaultMainColor = color;
    }
    update();
  }

  updateDefaultTextColor(Color? color) {
    if (color != null) {
      defaultTextColor = color;
    }
    update();
  }

  updateDefaultBgColor(Color? color) {
    if (color != null) {
      defaultBgColor = color;
    }
    update();
  }

  static getPrimarySwatchColor() {
    print("====================Color Value == ${defaultTextColor.value}");
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

  static resetDefault() {
    defaultMainColor = rdefaultMainColor;
    defaultTextColor = rdefaultTextColor;
    defaultBgColor = rdefaultBgColor;
    StorageHelper().setDefaultBgColor();
    StorageHelper().setDefaultBlogLayout();
    StorageHelper().setDefaultMainColor();
    StorageHelper().setDefaultTextColor();
    StorageHelper().setThemeMode();
  }

  update() {
    notifyListeners();
  }
}
