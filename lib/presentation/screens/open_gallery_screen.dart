import 'package:flutter/material.dart';

class OpenGalleryScreen extends StatefulWidget {
  const OpenGalleryScreen({Key? key}) : super(key: key);

  @override
  State<OpenGalleryScreen> createState() => _OpenGalleryScreenState();
}

class _OpenGalleryScreenState extends State<OpenGalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Open Gallery"),
      ),
    );
  }
}
