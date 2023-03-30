import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/resources/app_string.dart';
import '../../core/resources/images_manager.dart';
import '../../core/theme/colors.dart';
import '../../core/utils/image_cropper_page.dart';
import '../../core/utils/image_picker_class.dart';
import '../../main.dart';
import '../../recognization_page.dart';
import '../widgets/defaultButton/defaultButtonWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextRecognizer _textRecognizer =
      TextRecognizer(script: TextRecognitionScript.chinese);

  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;

  @override
  void dispose() async {
    _canProcess = false;
    _textRecognizer.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImagesAssets.scanImage),
            SizedBox(
              height: 40.h,
            ),
            DefaultButton(
              btnTitle: AppStrings.openCamera,
              btnColor: primaryColor,
              textStyle: TextStyle(color: white),
              icon: SvgPicture.asset(IconsAssets.camera),
              onPressed: () {
                pickImage(source: ImageSource.camera).then((value) {
                  if (value != '') {
                    imageCropperView(value, context).then((value) {
                      if (value != '') {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) => RecognizePage(
                              path: value,
                            ),
                          ),
                        );
                      }
                    });
                  }
                });
              },
              btnWidth: 300.w,
            ),
            SizedBox(
              height: 20.h,
            ),
            DefaultButton(
              btnTitle: AppStrings.openGallery,
              btnColor: primaryColor,
              textStyle: TextStyle(color: white),
              icon: SvgPicture.asset(IconsAssets.gallery),
              btnWidth: 300.w,
              onPressed: () {
                pickImage(source: ImageSource.gallery).then((value) {
                  if (value != '') {
                    imageCropperView(value, context).then((value) {
                      if (value != '') {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) => RecognizePage(
                              path: value,
                            ),
                          ),
                        );
                      }
                    });
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
