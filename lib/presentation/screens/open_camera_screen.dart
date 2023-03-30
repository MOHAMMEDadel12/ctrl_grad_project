import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class OpenCameraScreen extends StatefulWidget {

  OpenCameraScreen(
      {Key? key,
        this.text,
        required this.onImage,
        this.initialDirection = CameraLensDirection.back})
      : super(key: key);

  final String? text;
  final Function(InputImage inputImage) onImage;
  final CameraLensDirection initialDirection;

  @override
  State<OpenCameraScreen> createState() => _OpenCameraScreenState();
}

class _OpenCameraScreenState extends State<OpenCameraScreen> {


  File? _pickedFile;
  String? _path;
  CroppedFile? _croppedFile;
  Future<void> _cropImage() async {
    if (_pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _pickedFile!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
        _processPickedFile(XFile(croppedFile.path));
      }
    }
  }
  Future<void> _uploadImage(ImageSource source) async {
    setState(() {
      _pickedFile = null;
      _path = null;
    });
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      _processPickedFile(pickedFile);
    }
    setState(() {});
  }
  void _clear() {
    setState(() {
      _pickedFile = null;
      _croppedFile = null;
    });
  }
  Widget _image() {
    if (_croppedFile != null) {
      final path = _croppedFile!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 200.w,
          maxHeight: 300.h,
        ),
        child: kIsWeb ? Image.network(path) : Image.file(File(path)),
      );
    } else if (_pickedFile != null) {
      final path = _pickedFile!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 200.w,
          maxHeight: 300.h,
        ),
        child: kIsWeb ? Image.network(path) : Image.file(File(path)),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }


  Future _processPickedFile(XFile? pickedFile) async {
    final path = pickedFile?.path;
    if (path == null) {
      return;
    }
    setState(() {
      _pickedFile = File(path);
    });
    _path = path;
    final inputImage = InputImage.fromFilePath(path);
    widget.onImage(inputImage);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Open Gallery"),

      ),
      body: Column(
        children: [
          Center(
            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kIsWeb ? 24.0 : 16.0),
                  child: Card(
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(kIsWeb ? 24.0 : 16.0),
                      child: _image(),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      onPressed: _clear,
                      backgroundColor: Colors.redAccent,
                      tooltip: 'Delete',
                      child: const Icon(Icons.delete),
                    ),
                    if (_croppedFile == null)
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: FloatingActionButton(
                          onPressed: _cropImage,
                          backgroundColor: const Color(0xFFBC764A),
                          tooltip: 'Crop',
                          child: const Icon(Icons.crop),
                        ),
                      )
                  ],
                )
              ],
            ),
          ),
          if (_pickedFile != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.text!),
            ),
        ],
      ),
    );
  }
}
