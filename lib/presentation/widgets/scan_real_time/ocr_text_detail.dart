
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';




class OcrTextDetail extends StatefulWidget {
  String? ocrText;
  OcrTextDetail(this.ocrText);
  @override
  _OcrTextDetailState createState() => _OcrTextDetailState();
}

var questionConteroller = TextEditingController();
var formKey = GlobalKey<FormState>();

class _OcrTextDetailState extends State<OcrTextDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questionConteroller = TextEditingController(text: widget.ocrText!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Edit Question'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[


            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                //autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: questionConteroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your Question ';
                  }
                  if (!RegExp(r'^How| [a-z][?] $').hasMatch(value)) {
                    return 'Enter valid question';
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    questionConteroller.text = val!;
                  });
                },
                onFieldSubmitted: (val) {
                  setState(() {
                    questionConteroller.text = val;
                  });
                },
                decoration: const InputDecoration(),
              ),
            ),

            SizedBox(
              height: 50.h,
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(questionConteroller.text),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Center(
                child: Card(
                  color: primaryColor,
                  elevation: 5,
                  child: GestureDetector(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 25.0.w,vertical: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Go',style: TextStyle(
                            color: white,
                            fontSize: 25.sp
                          ),),
                          Icon(Icons.arrow_forward,color: white,)
                        ],
                      ),
                    ),
                    onTap: () {
                      if (formKey.currentState!.validate())
                      {

                      }
                    },
                  ),
                ),
              ),
            ),

            // ListTile(
            //   title: Text(widget.ocrText.language),
            //   subtitle: const Text('Language'),
            // ),
            // ListTile(
            //   title: Text(widget.ocrText.top.toString()),
            //   subtitle: const Text('Top'),
            // ),
            // ListTile(
            //   title: Text(widget.ocrText.bottom.toString()),
            //   subtitle: const Text('Bottom'),
            // ),
            // ListTile(
            //   title: Text(widget.ocrText.left.toString()),
            //   subtitle: const Text('Left'),
            // ),
            // ListTile(
            //   title: Text(widget.ocrText.right.toString()),
            //   subtitle: const Text('Right'),
            // ),
          ],
        ),
      ),
    );
  }
}
