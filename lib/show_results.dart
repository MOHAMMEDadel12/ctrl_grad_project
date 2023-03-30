import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ctrl_graduation_project/presentation/widgets/defaultButton/defaultButtonWidget.dart';
import 'package:flutter/material.dart';


import 'core/theme/colors.dart';

class ShowResultScreen extends StatefulWidget {

  final String ? qController ;
  final String ? answerController1 ;
  final String ? answerController2 ;
  final String ? answerController3 ;
  final String ? answerController4 ;

  const ShowResultScreen({Key? key, this.qController, this.answerController1, this.answerController2, this.answerController3, this.answerController4}) : super(key: key);
  @override
  State<ShowResultScreen> createState() => _ShowResultScreenState();
}

class _ShowResultScreenState extends State<ShowResultScreen> {
  bool _isBusy = false;




  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Answer Question'),

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
                  height: 100,
                  width: 600,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: Colors.green,
                    child: Center(child: Text(widget.qController!)),

                  ),
                ),
                SizedBox(
                  height: 50,
                ),

                // answers 1
                Container(
                  height: 60,
                  width: 600,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: Colors.grey,
                    child: Center(child: Text(widget.answerController1!)),

                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // answers 2
                Container(
                  height: 60,
                  width: 600,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: Colors.grey,
                    child: Center(child: Text(widget.answerController2!)),

                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // answers 3
                Container(
                  height: 60,
                  width: 600,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: Colors.grey,
                    child: Center(child: Text(widget.answerController3!)),

                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // answers 4
                Container(
                  height: 60,
                  width: 600,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: Colors.grey,
                    child: Center(child: Text(widget.answerController4!)),

                  ),
                ),
                SizedBox(height: 40,),

                ConditionalBuilder(
                  condition: true,
                  builder: (context) =>
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: DefaultButton(
                          btnTitle: 'Scan Another Question',
                          onPressed: () async {
                            // ProfileCubit.get(context)
                            //     .postFeedback(
                            //     message: messageController.text,
                            //     rate: initialRating);
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

}
