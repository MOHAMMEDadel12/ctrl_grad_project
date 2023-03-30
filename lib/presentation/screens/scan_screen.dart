import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';
class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {


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
    // TODO: implement initState
    super.initState();
    _read();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    );
  }
}
