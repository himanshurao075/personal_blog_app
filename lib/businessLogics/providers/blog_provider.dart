
import 'package:blog_assesment/data_layer/Storage/storage_helper.dart';
import 'package:blog_assesment/data_layer/models/blog_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_provider.dart';

class BlogProvider extends BaseProvider { 
 TextEditingController title = TextEditingController();
 TextEditingController body = TextEditingController();
 BlogModal blogModal = BlogModal(title: "", body: "");
  List<BlogModal> allBlogs = [];

BlogProvider (){
     fetchAllBlog();
}

fetchAllBlog() async {
 allBlogs =  await StorageHelper().fetchBlogs();
 update();
}


 saveBlog(BuildContext context) async{
  blogModal.title = title.text;
  blogModal.body = body.text;
  allBlogs.add(blogModal);
  allBlogs = await StorageHelper().saveBlogs(allBlogs);
  title.clear();
  body.clear();
  blogModal = BlogModal(title: "", body: "");
 Navigator.pop(context);
 update();
 }
deletBlog(int index)async{
  allBlogs.removeAt(index);
  allBlogs = await  StorageHelper().saveBlogs(allBlogs);
update();
}
 update(){
  notifyListeners();
 }

}