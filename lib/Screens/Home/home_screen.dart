import 'package:blog_assesment/AppSettings.dart';
import 'package:blog_assesment/PersonalBlogApp.dart';
import 'package:blog_assesment/Screens/Home/new_blog_page.dart';
import 'package:blog_assesment/businessLogics/providers/auth_provider.dart';
import 'package:blog_assesment/businessLogics/providers/blog_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/app_color.dart';
import 'app_settings_screen.dart';
import 'view_blog_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AuthProvider _authProvider;
  late BlogProvider _blogProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _blogProvider = Provider.of<BlogProvider>(context, listen: false);

    _authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);
    _blogProvider = Provider.of<BlogProvider>(context);
    final theme = Theme.of(context);
    return Scaffold(
      key: _key,
      floatingActionButton: CircleAvatar(
          radius: 30,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateBlogScreen()));
            },
            icon: const Icon(
              Icons.post_add_rounded,
            ),
          )),
      drawer: _drawer(context),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              AppSettings.blogLayoutIsListView =
                  !AppSettings.blogLayoutIsListView;
              setState(() {});
            },
            child: Icon(
              AppSettings.blogLayoutIsListView
                  ? CupertinoIcons.circle_grid_3x3
                  : CupertinoIcons.list_bullet,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              _authProvider.logout(context);
            },
            child: const Icon(
              CupertinoIcons.square_arrow_left,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Welcome!",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: theme.primaryColor,
                      fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  AppSettings.userModal.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: theme.primaryColor,
                      fontSize: 35),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            AppSettings.blogLayoutIsListView
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: _blogProvider.allBlogs.length,
                    itemBuilder: (context, index) {
                      final item = _blogProvider.allBlogs[index];
                      final textColor = item.textColor == null
                          ? AppColor.defaultTextColor
                          : Color(item.textColor ?? 0);

// final bgColor=  item.bgColor ==null ? AppColor.defaultBgColor :  Color(item.bgColor??0);

                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ViewBlogScreen(blog: item)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: theme.primaryColor.withOpacity(0.1),
                              border: Border(
                                  left: BorderSide(
                                      width: 3, color: theme.primaryColor)),
                              // borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),topRight: Radius.circular(5))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: textColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(item.body,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12))
                                        ]),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                        onPressed: () {
                                          _blogProvider.deletBlog(index);
                                        },
                                        icon: Icon(
                                          Icons.delete_forever,
                                          color: theme.primaryColor,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                : GridView.builder(
                    shrinkWrap: true,
                    itemCount: _blogProvider.allBlogs.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.25,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final item = _blogProvider.allBlogs[index];
                      final textColor = item.textColor == null
                          ? AppColor.defaultTextColor
                          : Color(item.textColor ?? 0);
                      return Container(
                        // height: 00,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border(
                              bottom: BorderSide(
                                  width: 3, color: theme.primaryColor),
                              left: BorderSide(
                                  width: 1, color: theme.primaryColor),
                              right: BorderSide(
                                  width: 1, color: theme.primaryColor),
                              top: BorderSide(
                                  width: 1, color: theme.primaryColor),
                            )),
                        child: Stack(children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewBlogScreen(
                                                        blog: item)));
                                      },
                                      child: Center(
                                        child: Icon(
                                          Icons.edit_document,
                                          color: Colors.grey,
                                          size: 50,
                                        ),
                                      )),
                                ),
                                Text(
                                  item.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: textColor,
                                      fontSize: 16),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              right: 0,
                              child: IconButton(
                                  onPressed: () {
                                    _blogProvider.deletBlog(index);
                                  },
                                  icon: Icon(Icons.delete_forever)))
                        ]),
                      );
                    })
          ],
        ),
      ),
    );
  }

  _drawer(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: theme.canvasColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Personal Blog App',
                    style: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: theme.primaryColor,
            ),
            minLeadingWidth: 5,
            title: const Text(
              "Theme Settings",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AppSettingsScreen()));
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Personal Blog App",
                  style: TextStyle(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Version : 1.0.0"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
