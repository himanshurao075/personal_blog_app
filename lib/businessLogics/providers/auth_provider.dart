import 'package:blog_assesment/AppSettings.dart';
import 'package:blog_assesment/Screens/Authentications/login_screen.dart';
import 'package:blog_assesment/Screens/Home/home_screen.dart';
import 'package:blog_assesment/data_layer/models/user_modal.dart';
import 'package:blog_assesment/res/app_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../data_layer/Storage/storage_helper.dart';
import 'base_provider.dart';

class AuthProvider extends BaseProvider {
  // final AuthRepository _authRepository = AuthRepository();
  // final LoginRequest _loginRequest = LoginRequest();
  // LoginResponseModel _loginResponse = LoginResponseModel();

  final loginFormKey = GlobalKey<FormState>();
  final registrationFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMsg = '';
  bool showErrorMsg = false;

  var errorMessage = "";

  var isHitApi = false;

  bool checkIfEmailValidate(String value) {
    var bool = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (bool == false) {
      var numBool = RegExp(r"^[0-9]+").hasMatch(value);
      return numBool;
    }
    return bool;
  }

  bool isPasswordValid(String value) {
    var bool = RegExp(
            r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$")
        .hasMatch(value);
    return bool;
  }

  bool isNameValidate(String value) {
    if (value.isNotEmpty && value.length >= 3) {
      return true;
    }
    return false;
  }

  cancelErrorMsg() {
    showErrorMsg = false;
    errorMessage = "";
    update();

  }

  Future<String?> doLogin(BuildContext context) async {
    if (loginFormKey.currentState!.validate()) {
      if (AppSettings.users.isEmpty) {
        errorMessage = "User Not Exits";
        showErrorMsg = true;
      } else {
        try {
          UserModal user = AppSettings.users
              .firstWhere((element) => element.email == emailController.text);
          if (user.email == emailController.text) {
            if (user.password == passwordController.text) {
             AppSettings.  userModal = user;
            AppSettings.   userModal.isUserLoggedIn = true;
               StorageHelper().markUserLoggedIn();
               Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
            } else {
              errorMessage = "Password Not Match";
              showErrorMsg = true;
            }
          }
        } catch (e) {
          errorMessage = "User Not Exists";
          showErrorMsg = true;
        }
      }
    }
    update();
  }

  Future<String?> doRegister(BuildContext context) async {
    if (registrationFormKey.currentState!.validate()) {
      final registerRequest = getRegisterRequestModal();
      bool isUSerPresent = false;
      AppSettings.users.forEach((element) {
        if (element.email == registerRequest.email) {
          isUSerPresent = true;
        }
      });
      if (!isUSerPresent) {
        AppSettings.users.add(registerRequest);
        StorageHelper().updateUserList();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      } else {
        Fluttertoast.showToast(
            msg: "User already register with this email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColor.defaultMainColor,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  UserModal getRegisterRequestModal() {
    return UserModal(
        name: nameController.text,
        email: emailController.text.trim(),
        password: passwordController.text);
  }
  update(){
    notifyListeners();
  }
}
