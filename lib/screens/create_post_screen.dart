import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/widgets/elevated_button_widget.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final createPostController = TextEditingController();

  var db = FirebaseFirestore.instance;

  Future createPost({required String post}) async {
    final json = <String, dynamic>{"post": post};

    await db.collection("posts").doc().set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          "Create Post",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            TextFormField(
              controller: createPostController,
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
              buttonText: 'create post',
              onPressed: () async {
                final postMessage = createPostController.text;
                await createPost(post: postMessage);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
