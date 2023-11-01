import 'package:blog_assesment/res/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'businessLogics/providers/auth_provider.dart';
import 'businessLogics/providers/base_provider.dart';
import 'businessLogics/providers/blog_provider.dart';

class RegisterProviders {
  //Register all providers used in the application here
  static List<SingleChildWidget> providers(BuildContext context) => [
        ChangeNotifierProvider<BaseProvider>(
          create: (context) => BaseProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<BlogProvider>(
          create: (context) => BlogProvider(),
        ),
        ChangeNotifierProvider<AppColor>(
          create: (context) => AppColor(),
        ),
      ];
}
