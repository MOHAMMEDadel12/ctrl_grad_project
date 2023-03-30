import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';

import 'ocr_text_detail.dart';

class GetOcrSS extends StatefulWidget {
  const GetOcrSS({Key? key}) : super(key: key);

  @override
  _GetOcrSSState createState() => _GetOcrSSState();
}

class _GetOcrSSState extends State<GetOcrSS> {

  Future<Null> _read() async {
    List<OcrText> texts = [];
    texts = await FlutterMobileVision.read(
      flash: _torchOcr,
      autoFocus: true,
      multiple: true,
      waitTap: _waitTapOcr,
      //OPTIONAL: close camera after tap, even if there are no detection.
      //Camera would usually stay on, until there is a valid detection
      forceCloseCameraOnTap: true,
      //OPTIONAL: path to save image to. leave empty if you do not want to save the image
      imagePath: '',
      //'path/to/file.jpg'
      showText: true,
      preview: _previewOcr ?? FlutterMobileVision.PREVIEW,
      // scanArea: Size(_scanpreviewOcr.width - 20, _scanpreviewOcr.height - 20),
      camera: _cameraOcr ?? FlutterMobileVision.CAMERA_BACK,
      fps: 2.0,
    );
    if (!mounted) return;
  }


  int? _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  bool _torchOcr = false;
  bool _waitTapOcr = false;
  Size? _previewOcr;
  @override
  void initState() {
    super.initState();
    FlutterMobileVision.start().then((previewSizes) => setState(() {
          _read();
          _previewOcr = previewSizes[_cameraOcr]!.first;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: _read,
        child: const Text('Scan'),
      ),
    );
  }

}
