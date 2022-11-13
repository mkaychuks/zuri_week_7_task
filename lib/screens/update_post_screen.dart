// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_application/constants/widgets/elevated_button_widget.dart';

class UpdatePostScreen extends StatefulWidget {
  UpdatePostScreen({super.key, required this.postBody, required this.postId});
  String postBody;
  String postId;

  @override
  State<UpdatePostScreen> createState() => _UpdatePostScreenState(this.postBody, this.postId);
}

class _UpdatePostScreenState extends State<UpdatePostScreen> {

  _UpdatePostScreenState(this.postBody, this.postId);
  String postBody;
  String postId;


  final updatePostController = TextEditingController();
  var db = FirebaseFirestore.instance;

  Future updatePost({required String post}) async {
    final json = <String, dynamic>{"post": post};
    await db.collection("posts").doc(postId).update(json);
  }









  @override
  Widget build(BuildContext context) {

    updatePostController.text = postBody;

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          "Update Post",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            TextFormField(
              // initialValue: post,
              controller: updatePostController,
              decoration: InputDecoration(
                hintText: "Write Something here",
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 178, 213, 218)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 178, 213, 218)),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 178, 213, 218)),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              maxLines: 10,
            ),
            const SizedBox(
              height: 12.0,
            ),
            ElevatedButtonWidget(
              buttonColor: Colors.blueAccent,
              buttonText: 'update',
              onPressed: () async {
                final updatedPostMessage = updatePostController.text;
                await updatePost(post: updatedPostMessage);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
