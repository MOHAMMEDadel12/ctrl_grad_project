import 'package:bloc/bloc.dart';
import 'package:ctrl_graduation_project/presentation/controller/cubit/profile/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/local_network/cashe_helper.dart';
import '../../../../core/services/remote_network/dio_helper.dart';
import '../../../../data/model/feedback_model.dart';


class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());


  FeedbackModel  ? feedbackModel ;
  FeedbackModel  ? contactusModel ;

  static ProfileCubit get(context) => BlocProvider.of(context);

  void postFeedback({
    required String message,
    required double rate,

  }) {
    emit(FeedbackLoadingState());
    DioHelper.postData(
      url: 'user/feedback',
      data: {
        'rate': rate,
        'message': message,
      },
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {

      feedbackModel = FeedbackModel.fromJson(value.data);
      print(value.data);
      emit(FeedbackSuccessState(feedbackModel));
      print("A7a");
      print(value.data);
      print(value.data);
      //  emit(RegisterSuccessState(registerModel: registerModel!));
    }).catchError((error){
      emit(FeedbackErrorState(error.toString()));
      print("errrrrrrrrrrrrrrrrorrr");
      print("errrrrrrrrrrrrrrrrorrr");

    });
    //     .catchError((error) {
    //   print(error.toString());
    //   emit(FeedbackErrorState());
    // });
  }

  void postContactUs({
    required String name,
    required String email,
    required String message,

  }) {
    emit(ContactUsLoadingState());
    DioHelper.postData(
      url: 'user/contactus',
      data: {
        'name': name,
        'email': email,
        'message': message,
      },
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {

      contactusModel = FeedbackModel.fromJson(value.data);
      print(value.data);
      emit(ContactUsSuccessState(contactusModel));

    }).catchError((error){
      emit(ContactUsErrorState(error.toString()));
      print("errrrrrrrrrrrrrrrrorrr");
    });
    //     .catchError((error) {
    //   print(error.toString());
    //   emit(FeedbackErrorState());
    // });
  }
}
