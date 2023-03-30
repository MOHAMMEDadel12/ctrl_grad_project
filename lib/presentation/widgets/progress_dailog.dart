import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';


class ProgressDilog extends StatelessWidget {

  final String ?   message ;

  const ProgressDilog({this.message}) ;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: primaryColor,
      child: Container(
        margin: EdgeInsets.all(8.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white ,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 6.0,
              ),
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(secondColor),),
              SizedBox(
                width: 26.0,
              ),
              Text(message! , style: TextStyle(color: Colors.black , fontSize: 12.0),)
            ],
          ),
        ),
      ),

    );
  }
}
