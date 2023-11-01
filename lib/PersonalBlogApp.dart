import 'package:blog_assesment/Screens/splash_screen.dart';
import 'package:blog_assesment/res/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider_registaration.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(debugLabel:"navigator");

class PersonalBlogApp extends StatefulWidget {
  const PersonalBlogApp({Key? key}) : super(key: key);

  @override
  _PersonalBlogAppState createState() => _PersonalBlogAppState();
}

class _PersonalBlogAppState extends State<PersonalBlogApp>
    with WidgetsBindingObserver {

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    
    if (state == AppLifecycleState.paused) {
    }
     else if (state == AppLifecycleState.resumed) {
    }
    else if (state == AppLifecycleState.detached) {}
  }

  @override
  Widget build(BuildContext context) {
 
    return MultiProvider(
              providers: RegisterProviders.providers(context),
              child: MaterialApp(
                navigatorKey: navigatorKey,
                builder: (BuildContext context, Widget? child) {
                  return MediaQuery(
                    data: MediaQuery.of(context),
                    child: child!,
                  );
                },
                theme: AppTheme.getAppTheme(),
                // darkTheme: AppTheme.getDartTheme(),
                themeMode: AppTheme.getThemeMode(),
                debugShowCheckedModeBanner: false,
                home: const SplashScreen(),
                
              ))
            ;
  }


}