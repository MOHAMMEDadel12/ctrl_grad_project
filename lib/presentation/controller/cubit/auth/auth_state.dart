

import '../../../../data/model/forget_password_model.dart';
import '../../../../data/model/login)model.dart';
import '../../../../data/model/register_model.dart';
import '../../../../data/model/reset_password.dart';

abstract class AuthStates {}

class RegisterInitialState extends AuthStates {}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {
  final RegisterModel registerModel;
  RegisterSuccessState({required this.registerModel});
}

class RegisterErrorState extends AuthStates {
  final String error;
  RegisterErrorState(this.error);
}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final LoginModel? loginModel;
  LoginSuccessState({this.loginModel});
}

class LoginErrorState extends AuthStates {
  final String error;
  LoginErrorState(this.error);
}
class ForgetPasswordLoadingState extends AuthStates {}

class ForgetPasswordSuccessState extends AuthStates {

  ForgetPasswordModel ?forgetPasswordModel;
  ForgetPasswordSuccessState({required this.forgetPasswordModel});

}

class ForgetPasswordErrorState extends AuthStates {
  final String error;
  ForgetPasswordErrorState(this.error);
}

class VerifyCodeLoadingState extends AuthStates {}

class VerifyCodeSuccessState extends AuthStates {


}

class VerifyCodeErrorState extends AuthStates {
  final String error;
  VerifyCodeErrorState(this.error);
}
class ResetPasswordLoading extends AuthStates {}

class  ResetPasswordSuccessState extends AuthStates {
ResetPasswordModel?resetPasswordModel;
ResetPasswordSuccessState({required this.resetPasswordModel});
}

class  ResetPasswordErrorState extends AuthStates {
  final String error;
  ResetPasswordErrorState(this.error);
}