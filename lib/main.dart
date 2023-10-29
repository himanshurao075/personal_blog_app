import 'dart:async';

import 'package:blog_assesment/AppSettings.dart';
import 'package:blog_assesment/PersonalBlogApp.dart';
import 'package:blog_assesment/data_layer/Storage/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:safe_device/safe_device.dart';

Future<void> main() async{

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
       await GetStorage.init();
  StorageHelper().initialised();
  initPlatformState();
  Function originalOnError = FlutterError.onError!;
  FlutterError.onError = (FlutterErrorDetails errorDetails) async {
    originalOnError(errorDetails);
  };

  runApp(const PersonalBlogApp());
  
}


Future<void> initPlatformState() async {
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    AppSettings.isJailBroken = await SafeDevice.isJailBroken;
    
  } on PlatformException {
    AppSettings.isJailBroken = true;
    
  }
  finally {
//     if(AppSettings.isJailBroken)
//     {
// // print("it is jailbroken");
//     }|
  }
}
