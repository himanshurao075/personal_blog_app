import 'package:blog_assesment/AppSettings.dart';
import 'package:blog_assesment/PersonalBlogApp.dart';
import 'package:blog_assesment/data_layer/Storage/storage_helper.dart';
import 'package:blog_assesment/res/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  late AppColor appColorProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appColorProvider = Provider.of<AppColor>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    appColorProvider = Provider.of<AppColor>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Settings"),
        actions: [
          IconButton(
              onPressed: () {
                AppColor.resetDefault();

                runApp(PersonalBlogApp());
              },
              icon: Text(
                "Reset",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!AppColor.isDarkTheme)
              ListTile(
                visualDensity: VisualDensity.comfortable,
                leading: Icon(
                  Icons.color_lens_outlined,
                  color: theme.primaryColor,
                ),
                title: const Text(
                  "Theme Color",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  "Will change main theme color of app.",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                trailing: GestureDetector(
                    onTap: () {
                      changeColorDialog((changedColor) {
                        appColorProvider.updateDefaultMainColor(changedColor);
                        StorageHelper().setDefaultMainColor();
                        // AppColor.defaultMainColor =
                        //     changedColor ?? AppColor.defaultMainColor;
                        runApp(PersonalBlogApp());
                      });
                    },
                    child: CircleAvatar(
                        backgroundColor: AppColor.defaultMainColor)),
              ),
            ListTile(
              key: UniqueKey(),
              visualDensity: VisualDensity.comfortable,
              leading: Icon(
                Icons.text_fields_rounded,
                color: theme.primaryColor,
              ),
              title: const Text(
                "Text Color",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: const Text(
                "Will change default text color of blog.",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              trailing: GestureDetector(
                  onTap: () {
                    changeColorDialog((changedColor) {
                      appColorProvider.updateDefaultTextColor(changedColor);
                      StorageHelper().setDefaultTextColor();

                      // AppColor.defaultTextColor =
                      //     changedColor ?? AppColor.defaultTextColor;
                      runApp(PersonalBlogApp());
                    });
                  },
                  child:
                      CircleAvatar(backgroundColor: AppColor.defaultTextColor)),
            ),
            ListTile(
              visualDensity: VisualDensity.comfortable,
              leading: Icon(
                Icons.square_outlined,
                color: theme.primaryColor,
              ),
              title: const Text(
                "Background Color",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: const Text(
                "Will change default background color of blog.",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              trailing: GestureDetector(
                  onTap: () {
                    changeColorDialog((changedColor) {
                      appColorProvider.updateDefaultBgColor(changedColor);
                      StorageHelper().setDefaultBgColor();

                      // AppColor.defaultBgColor =
                      //     changedColor ?? AppColor.defaultBgColor;
                      runApp(PersonalBlogApp());
                    });
                  },
                  child:
                      CircleAvatar(backgroundColor: AppColor.defaultBgColor)),
            ),
            ListTile(
                visualDensity: VisualDensity.comfortable,
                leading: Icon(
                  Icons.square_outlined,
                  color: theme.primaryColor,
                ),
                title: const Text(
                  "Dark Theme Mode",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  "Will enable dark theme.",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                trailing: Switch(
                  onChanged: (val) {
                    appColorProvider.changeThemeToDarkMode();
                    runApp(PersonalBlogApp());
                  },
                  value: AppColor.isDarkTheme,
                )),
          ],
        ),
      ),
    );
  }

  changeColorDialog(Function(Color? c) onColorChanged) {
    Color? newColor;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick a color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: AppColor.defaultMainColor,
              onColorChanged: (color) {
                newColor = color;
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Got it'),
              onPressed: () {
                Navigator.of(context).pop();
                onColorChanged(newColor);
              },
            ),
          ],
        );
      },
    );
  }
}
