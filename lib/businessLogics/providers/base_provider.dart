
import 'package:blog_assesment/Screens/Authentications/login_screen.dart';
import 'package:flutter/material.dart';

import '../../Utils/Helper/enums.dart';
import '../../Utils/Helper/internet_helper.dart';
import '../../data_layer/Storage/storage_helper.dart';

class BaseProvider extends ChangeNotifier {

  bool? checkNetwork;
  /* Function to check internet connection */
  
  Future<bool> checkInternet() async {
     checkNetwork =  await NetworkConnection.instance.checkInternet();
     notifyListeners();
    return await NetworkConnection.instance.checkInternet();
  }

  // getExceptionMessage
  String? getExceptionMessage({required ExceptionType exceptionType}){
    switch(exceptionType){
      case ExceptionType.API_EXCEPTION :
        return "API Exception";
      case ExceptionType.TIMEOUT_EXCEPTION :
        return "Timeout Exception";
      case ExceptionType.SOCKET_EXCEPTION :
        return "Socket Excpetion";
      case ExceptionType.PARSE_EXCEPTION :
        return "Parse Exception";
      case ExceptionType.NO_EXCEPTION:
        return "No Exception";
    }
  }

 

  void logout(BuildContext context) async {
    await _clearData();
    StorageHelper().logOut();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }

  Future<void> _clearData() async {
   
  }
}