import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/local_network/cashe_helper.dart';
import '../../../../core/services/remote_network/dio_exceptions.dart';
import '../../../../core/services/remote_network/dio_helper.dart';
import '../../../../data/model/forget_password_model.dart';
import '../../../../data/model/login)model.dart';
import '../../../../data/model/register_model.dart';
import '../../../../data/model/reset_password.dart';
import '../../../../data/model/verify_model.dart';
import '../../../widgets/components/components.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {

  RegisterModel? registerModel;
  LoginModel? loginModel;
  ForgetPasswordModel? forgetPasswordModel;
  VerifyModel? verifyModel;
  ResetPasswordModel? resetPasswordModel;

  AuthCubit() : super(RegisterInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String password,
    required String gender,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: 'auth/signup', data: {
      "firstname": firstName,
      "lastname": lastName,
      "username": userName,
      "email": email,
      "password": password,
      "gender": gender,
    }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      print(value.data);
      emit(RegisterSuccessState(registerModel: registerModel!));
    }).catchError((error){

    });
  }

  void userLogin({
    required email,
    required password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: '/auth/login', data: {
      "email": email,
      "password": password,
    }).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      print(value.data);
      print(loginModel!.jwt);
      emit(LoginSuccessState(loginModel: loginModel!));
      CacheHelper.saveData(
        key: 'token',
        value: loginModel!.jwt,
      );
    }).catchError((e) {
      emit(
        LoginErrorState(
          e.toString(),
        ),
      );

    });
  }

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoadingState());
    DioHelper.postData(url: '/user/forgetpassword', data: {"email": email})
        .then((value) {
      forgetPasswordModel = ForgetPasswordModel.fromJson(value.data);
      print(value.data);
      emit(
          ForgetPasswordSuccessState(forgetPasswordModel: forgetPasswordModel));
    });
  }

  Future<void> verifyCode({required String email, required String code}) async {
    emit(VerifyCodeLoadingState());
    DioHelper.postData(url: '/user/verifiedcode', data: {
      "email": email,
      "code": code,
    }).then((value) {
      verifyModel = VerifyModel.fromJson(value.data);
      print(value.data);
      emit(VerifyCodeSuccessState());
    });
  }

  void resetPassword({required String email, required String password}) {
    emit(ResetPasswordLoading());
    DioHelper.postData(
        url: '/user/resetpassword',
        data: {"email": email, "password": password}).then((value) {
      resetPasswordModel = ResetPasswordModel.fromJson(value.data);
      emit(ResetPasswordSuccessState(resetPasswordModel: resetPasswordModel));
    });
  }
}
