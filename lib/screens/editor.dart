import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';



class Editor extends StatefulWidget {
  const Editor({ Key? key }) : super(key: key);

  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            QuillToolbar.basic(controller: _controller),
            Expanded(
              child: Container(
                child: QuillEditor.basic(
                  controller: _controller,
                  readOnly: false,
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}