import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_summernote/flutter_summernote.dart';

class AddPostitScreen extends StatefulWidget {
  const AddPostitScreen({super.key});

  @override
  State<AddPostitScreen> createState() => _AddPostitScreenState();
}

class _AddPostitScreenState extends State<AddPostitScreen> {
  GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () async {
                print(await _keyEditor.currentState?.getText());
              },
              icon: Icon(Icons.abc))
        ],
      ),
      body: FlutterSummernote(
        hint: "Your text here...",
        key: _keyEditor,
        hasAttachment: true,
      ),
    );
  }
}
