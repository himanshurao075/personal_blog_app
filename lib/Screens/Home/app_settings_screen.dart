
import 'package:blog_assesment/AppSettings.dart';
import 'package:blog_assesment/PersonalBlogApp.dart';
import 'package:blog_assesment/res/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Settings"),
        actions: [IconButton(onPressed: (){
            AppColor.resetDefault ();
               runApp(PersonalBlogApp());

        }, icon: Text("Reset",style: TextStyle(fontWeight: FontWeight.bold),))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              trailing:
                  GestureDetector(
                     onTap: (){
                       changeColorDialog((changedColor){
                         AppColor.defaultMainColor = changedColor ??AppColor.defaultMainColor;
                         runApp(PersonalBlogApp());

                      });
                    },
                    child: CircleAvatar(backgroundColor: AppColor.defaultMainColor)),
            ),
            ListTile(
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
              trailing:
                  GestureDetector(
                    onTap: (){
                      changeColorDialog((changedColor){
                         AppColor.defaultTextColor = changedColor ??AppColor.defaultTextColor;
                         runApp(PersonalBlogApp());
                         

                      });
                    },
                    child: CircleAvatar(backgroundColor: AppColor.defaultTextColor)),
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
              trailing:
                  GestureDetector(
                    onTap: (){
                      changeColorDialog((changedColor){
                         AppColor.defaultBgColor = changedColor ??AppColor.defaultBgColor;
                         runApp(PersonalBlogApp());

                      });
                    },
                    child: CircleAvatar(backgroundColor: AppColor.defaultBgColor)),
            ),
           
          ],
        ),
      ),
    );
  }


  changeColorDialog (Function (Color? c) onColorChanged) {
    Color? newColor ;
    return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Pick a color'),
                          content: SingleChildScrollView(
                            child: BlockPicker(
                              pickerColor: AppColor.defaultMainColor,
                              onColorChanged: (color) {
                               newColor =color;
                              },
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Got it'),
                              onPressed: () {
                                Navigator.of(context).pop();                                onColorChanged(newColor);
                              },
                            ),
                          ],
                        );
                      },
                    );
  }
}
