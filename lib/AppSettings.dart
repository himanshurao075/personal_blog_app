import 'package:blog_assesment/data_layer/models/user_modal.dart';

class AppSettings {
  AppSettings._();

  static final AppSettings _instance = AppSettings._();

  factory AppSettings() {
    return _instance;
  }

  static bool isJailBroken = false;
   static const bool isProduction =false;
    static const bool isDev =true;

    static List<UserModal> users = [];
   static bool  blogLayoutIsListView = true;
    static bool userLoggedIn = false;
  static UserModal userModal = UserModal(name: "", email: "", password: "");
    
}
