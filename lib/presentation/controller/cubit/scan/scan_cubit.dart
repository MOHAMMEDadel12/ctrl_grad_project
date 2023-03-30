import 'package:bloc/bloc.dart';
import 'package:ctrl_graduation_project/presentation/controller/cubit/scan/scan_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/local_network/cashe_helper.dart';
import '../../../../core/services/remote_network/dio_helper.dart';
import '../../../../core/utils/constance.dart';
import '../../../../data/model/context_model.dart';

class ScanCubit extends Cubit<ScanStates> {
  ScanCubit() : super(ScanInitialState());

  static ScanCubit get(context) => BlocProvider.of(context);

  ContextModel? contextModel;
  void searchGoogle(String questionSearch) {
    DioHelper.postData(url: 'search/google', data: {
      'word': questionSearch,
    }).then((value) {
      contextModel = ContextModel.fromJson(value.data);

      if (contextModel!.data!.isNotEmpty) {
        CacheHelper.saveData(key: 'context', value: contextModel!.data![0]);
      }
      emit(ScanSuccessState());
    }).catchError((error) {

    });
  }
}
