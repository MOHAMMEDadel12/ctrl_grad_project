import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../screens/history_screen.dart';
import '../../../screens/home.dart';


import '../../../screens/scan_screen.dart';
import 'home_stste.dart';



class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(CommerceInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  bool shouldCheck = false;
  bool  isChecked=false;
  List<Widget> bottomScreens = [
     HomeScreen(),
     ScanScreen(),
     HistoryScreen(),
  ];
  void changeBottomNavBar(int index)
  {
    currentIndex=index;
    emit(CommerceChangeBottomNavBarState());
  }

  void changeCheckBox(bool check)
  {
    shouldCheck=check;
    emit(CommerceChangeBottomNavBarState());
  }
  void changeCheck(bool value)
  {
    isChecked=value;
  }

}
