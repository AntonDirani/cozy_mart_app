import 'package:flutter/material.dart';
import 'package:comment_box/comment/comment.dart';

class Comment extends StatefulWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comment Page"),
      ),
    );
  }
}
