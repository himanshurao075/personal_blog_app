import 'package:blog_assesment/Utils/Widgets/custome_widgets.dart';
import 'package:blog_assesment/businessLogics/providers/blog_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../businessLogics/providers/auth_provider.dart';

class CreateBlogScreen extends StatefulWidget {
  const CreateBlogScreen({super.key});

  @override
  State<CreateBlogScreen> createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  late BlogProvider blogProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blogProvider = Provider.of<BlogProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    blogProvider = Provider.of<BlogProvider>(context);
    print("TOTAL BLOGS = ${blogProvider.allBlogs.length}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Blog"),
        actions: [
          IconButton(
              onPressed: () {
                blogProvider.saveBlog(context);
              },
              icon: const Icon(Icons.check_circle_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomeTextFField(
                label: "Title",
                controller: blogProvider.title,
                hintText: "Enter title",
                
                validator: (val) {}),
            Expanded(
                // height: 200,
                child: CustomeBodyTextFField(
                    label: "Body",
                    controller: blogProvider.body,
                    hintText: "Enter title",
                    validator: (val) {})),
          ],
        ),
      ),
    );
  }
}
