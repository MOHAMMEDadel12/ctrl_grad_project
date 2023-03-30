
import '../../../../data/model/feedback_model.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {
//   final ProfileModelToya loginModel;
}

class ProfileErrorState extends ProfileStates {
  final String error;
  ProfileErrorState(this.error);
}



class FeedbackLoadingState extends ProfileStates {}
class FeedbackSuccessState extends ProfileStates {

  final FeedbackModel ?  feedback ;

  FeedbackSuccessState(this.feedback);
}
class FeedbackErrorState extends ProfileStates {
  final String error;
  FeedbackErrorState(this.error);
}


class ContactUsLoadingState extends ProfileStates {}
class ContactUsSuccessState extends ProfileStates {

  final FeedbackModel ?  feedback ;

  ContactUsSuccessState(this.feedback);
}
class ContactUsErrorState extends ProfileStates {
  final String error;
  ContactUsErrorState(this.error);
}
