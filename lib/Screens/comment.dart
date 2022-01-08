import 'package:flutter/material.dart';

class MyComment extends StatefulWidget {
  const MyComment({Key? key}) : super(key: key);

  @override
  State<MyComment> createState() => _MyCommentState();
}

class _MyCommentState extends State<MyComment> {
  TextEditingController commentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List filedata = [
    {'name': 'D.Ahmad', 'message': 'Woow it is a great App '},
    {'name': 'We', 'message': '40/40?!'},
  ];

  Widget commentChild() {
    return Expanded(
      child: SizedBox(
        height: 300,
        child: ListView.builder(
          //physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets
                  .zero, //const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
              child: ListTile(
                // leading: GestureDetector(
                //   onTap: () async {
                //     // Display the image in large form.
                //     print("Comment Clicked");
                //   },
                // ),
                title: Text(
                  filedata[index]['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                hoverColor: Colors.blueGrey,
                selectedTileColor: Colors.deepPurple,
                subtitle: Text(
                  filedata[index]['message'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
          itemCount: filedata.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 500,
        margin: EdgeInsets.only(top: 8),
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            commentChild(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: commentController,
                        decoration: const InputDecoration(
                          label: Text('write comment'),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            filedata.add({
                              "name": "User",
                              "message": "${commentController.text}"
                            });
                            commentController.clear();
                          });
                        },
                        icon: Icon(Icons.send)),
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom))
          ],
        ),
      ),
    );
  }
}
