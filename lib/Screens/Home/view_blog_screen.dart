import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data_layer/models/blog_modal.dart';
import '../../res/app_color.dart';

class ViewBlogScreen extends StatefulWidget {
  const ViewBlogScreen({super.key,required this.blog});
  final BlogModal blog;
  @override
  State<ViewBlogScreen> createState() => _ViewBlogScreenState();
}

class _ViewBlogScreenState extends State<ViewBlogScreen> {
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    final textColor=  widget.blog.textColor ==null ? AppColor.defaultTextColor  :  Color(widget.blog.textColor??0);
    return Scaffold(
      backgroundColor: widget.blog.bgColor==null ? AppColor.defaultBgColor : Color(widget.blog.bgColor??0),
      appBar: AppBar(),body:  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        Text(widget.blog.title,style: TextStyle(fontWeight: FontWeight.w700,color: textColor,fontSize: 26),),
          const SizedBox(height: 20,),
  
        SizedBox(
          height: 5,
          child: Divider(color: textColor,)),
          const SizedBox(height: 8,),
        Text(widget.blog.body, textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.w400,color: textColor,fontSize:14,)),
      ]),
    ),);
  }
}