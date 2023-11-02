import 'package:blog_assesment/AppSettings.dart';
import 'package:blog_assesment/data_layer/models/user_modal.dart';
import 'package:blog_assesment/res/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../models/blog_modal.dart';

class StorageHelper {
  StorageHelper._() {
    initialised();
  }

  static final StorageHelper _instance = StorageHelper._();
// final box = GetStorage('MyPref');
  factory StorageHelper() {
    return _instance;
  }
  initialised() async {
    // box.initStorage;/
    getUserList();
    fetchUserLoggedIn();
    getDefaultMainColor();
    getDefaultTextColor();
    getDefaultBgColor();
    getDefaultBlogLayout();
    getThemeMode();
  }

  Future<List<BlogModal>> saveBlogs(List<BlogModal> blogs) async {
    try {
      await GetStorage().write('blogs', blogs.map((e) => e.toJson()).toList());
      return fetchBlogs();
    } catch (e) {
      return [];
    }
  }

  List<BlogModal> fetchBlogs() {
    List<BlogModal> allBlogs = (List.castFrom((GetStorage().read(
              'blogs',
            ) ??
            [])
        .map((e) => BlogModal.fromJson(e))
        .toList()));

    return allBlogs;
  }

  updateUserList() async {
    await GetStorage()
        .write('userList', AppSettings.users.map((e) => e.toJson()).toList());
    await getUserList();
    print("USER : ${AppSettings.users}");
  }

  getUserList() async {
    AppSettings.users = (List.castFrom((GetStorage().read(
              'userList',
            ) ??
            [])
        .map((e) => UserModal.fromJson(e))
        .toList()));
    print("INTIAL USER : ${AppSettings.users}");
  }

  markUserLoggedIn() async {
    await GetStorage().write('userLoggedIn', AppSettings.userModal.toJson());
    await fetchUserLoggedIn();
  }

  fetchUserLoggedIn() async {
    final temp = GetStorage().read(
      'userLoggedIn',
    );
    AppSettings.userModal = UserModal.fromJson((temp ?? {}));
  }

  setThemeMode() async {
    await GetStorage().write('themeMode', AppColor.isDarkTheme);
    await getThemeMode();
  }

  setDefaultMainColor() async {
    await GetStorage()
        .write('defaultMainColor', AppColor.defaultMainColor.value);
    await getDefaultMainColor();
  }

  setDefaultTextColor() async {
    await GetStorage()
        .write('defaultTextColor', AppColor.defaultTextColor.value);
    await getDefaultTextColor();
  }

  setDefaultBgColor() async {
    await GetStorage().write('defaultBgColor', AppColor.defaultBgColor.value);
    await getDefaultBgColor();
  }

  setDefaultBlogLayout() async {
    await GetStorage()
        .write('defaultBlogLayout', AppSettings.blogLayoutIsListView);
    await getDefaultMainColor();
  }

  getThemeMode() async {
    final temp = GetStorage().read(
      'themeMode',
    );
    AppColor.isDarkTheme = temp ?? false;
  }

  getDefaultMainColor() async {
    final temp = GetStorage().read(
      'defaultMainColor',
    );
    AppColor.defaultMainColor =
        temp == null ? AppColor.defaultMainColor : Color(temp);
  }

  getDefaultTextColor() async {
    final temp = GetStorage().read(
      'defaultTextColor',
    );
    AppColor.defaultTextColor =
        temp == null ? AppColor.defaultTextColor : Color(temp);
  }

  getDefaultBgColor() async {
    final temp = GetStorage().read(
      'defaultBgColor',
    );
    AppColor.defaultBgColor =
        temp == null ? AppColor.defaultBgColor : Color(temp);
  }

  getDefaultBlogLayout() async {
    final temp = GetStorage().read(
      'defaultBlogLayout',
    );
    AppSettings.blogLayoutIsListView = temp ?? AppSettings.blogLayoutIsListView;
  }

  logOut() async {
    AppSettings.userModal.isUserLoggedIn = false;
    await GetStorage().write('userLoggedIn', AppSettings.userModal.toJson());
    await fetchUserLoggedIn();
  }
}
