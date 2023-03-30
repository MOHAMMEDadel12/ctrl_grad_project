import 'dart:convert';
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ctrl_graduation_project/presentation/widgets/defaultButton/defaultButtonWidget.dart';
import 'package:ctrl_graduation_project/show_results.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import 'core/services/local_network/cashe_helper.dart';
import 'core/services/remote_network/dio_helper.dart';
import 'core/theme/colors.dart';
import 'data/model/search_model.dart';

class RecognizePage extends StatefulWidget {
  final String? path;

  const RecognizePage({Key? key, this.path}) : super(key: key);

  @override
  State<RecognizePage> createState() => _RecognizePageState();
}

class _RecognizePageState extends State<RecognizePage> {
  bool _isBusy = false;

  SearchModel? searchModel;

  void search({
    required String word,
  }) {
    DioHelper.postData(
            url: 'search/google',
            data: {
              "word": word,
            },
            token: 'Barear ${CacheHelper.getData(key: 'token')}')
        .then((value) {
      searchModel = SearchModel.fromJson(value.data);
      print(value.data);
    });
  }

  TextEditingController qController = TextEditingController();
  TextEditingController answerController1 = TextEditingController();
  TextEditingController answerController2 = TextEditingController();
  TextEditingController answerController3 = TextEditingController();
  TextEditingController answerController4 = TextEditingController();

  String searchResults = '';

  // void search(String searchWord) async {
  //   final response = await http.post(
  //     Uri.parse('https://scan-for-solution.onrender.com/api/search/google'),
  //     body: {'word': searchWord},
  //     headers: {
  //       'Token' : 'Barear ${CacheHelper.getData(key: "token")}'
  //     },
  //   );
  //   final data = jsonDecode(response.body);
  //   print("ssssssssssssssssssssss");
  //   print(data);
  //   setState(() {
  //     searchResults = data.toString();
  //     print("searchResults: " + searchResults);
  //   });
  // }

  @override
  void initState() {
    super.initState();
    final InputImage inputImage = InputImage.fromFilePath(widget.path!);
    processImage(inputImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Question"),
          actions: [
            IconButton(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.TOPSLIDE,
                    dialogType: DialogType.ERROR,
                    headerAnimationLoop: false,
                    showCloseIcon: true,

                    btnCancelText: "Scan Again",
                    btnCancelColor: primaryColor,
                    btnOkColor: Colors.grey,
                    btnOkText: "Edit Question",
                    btnCancelIcon: Icons.add_a_photo,

                    // body: Center(child: Text(
                    //   'This isn’t a Question, Please entre a valid Question.',
                    //   style: TextStyle(fontStyle: FontStyle.normal,fontSize: 15),
                    // ),),
                    title: 'we have a problem!',
                    desc:
                        'This isn’t a Question, Please entre a valid Question.',
                    btnOkOnPress: () {},
                    btnCancelOnPress: () {},
                  ).show();
                },
                icon: Icon(Icons.bluetooth_connected_sharp))
          ],
        ),
        body: _isBusy == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),

                      // question
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          maxLines: 5,
                          textAlignVertical: TextAlignVertical.center,
                          controller: qController,
                          onChanged: (value) {
                            qController.text = value;
                            print(qController.text);
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: primaryColor,
                            prefixIcon:
                                Icon(Icons.question_answer_sharp, color: white),
                            suffixIcon: Icon(Icons.question_mark, color: white),
                            hintText: "question 1 ",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),

                      // answers 1
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          controller: answerController1,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey,
                            prefixIcon:
                                Icon(Icons.question_answer_sharp, color: white),
                            hintText: "sss",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // answers 2
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: answerController2,
                          onChanged: (value) {
                            answerController2.text = value;
                            print(answerController2.text);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey,
                            prefixIcon:
                                Icon(Icons.question_answer_sharp, color: white),
                            hintText: "sss",
                            iconColor: Colors.white,
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // answers 3
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          onChanged: (value) {
                            answerController3.text = value;
                            print(answerController3.text);
                          },
                          controller: answerController3,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey,
                            prefixIcon:
                                Icon(Icons.question_answer_sharp, color: white),
                            hintText: "sss",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // answers 4
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          onChanged: (value) {
                            answerController4.text = value;
                            print(answerController4.text);
                          },
                          controller: answerController4,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey,
                            prefixIcon:
                                Icon(Icons.question_answer_sharp, color: white),
                            hintText: "sss",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),

                      ConditionalBuilder(
                        condition: true,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 90.0),
                          child: DefaultButton(
                            btnTitle: 'SHOW RESULT',
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShowResultScreen(
                                          qController: qController.text,
                                          answerController1:
                                              answerController1.text,
                                          answerController2:
                                              answerController2.text,
                                          answerController3:
                                              answerController3.text,
                                          answerController4:
                                              answerController4.text,
                                        )),
                              );
                            },
                            btnColor: primaryColor,
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                        fallback: (context) => CircularProgressIndicator(),
                      )
                    ],
                  ),
                ),
              ));
  }

  void processImage(InputImage image) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    setState(() {
      _isBusy = true;
    });

    log(image.filePath!);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);

    List<String> parts =
        recognizedText.text.split("\n"); // split the string into separate lines

    String question = parts[0]; // get the first line as the question stem
    List<String> answers =
        parts.sublist(1); // get the rest of the lines as answer options

// print the question stem and answer options

    answerController1.text = answers[0];
    answerController2.text = answers[1];
    answerController3.text = answers[2];
    answerController4.text = answers[3];
    qController.text = question.toString();

    ///End busy state
    setState(() {
      _isBusy = false;
    });

    search(word: "salah");
  }
}
