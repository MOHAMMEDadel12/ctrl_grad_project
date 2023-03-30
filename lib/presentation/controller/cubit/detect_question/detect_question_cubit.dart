import 'package:flutter_bloc/flutter_bloc.dart';

import 'detect_question_state.dart';

class DetectQuestionCubit extends Cubit<DetectQuestionStates> {
  DetectQuestionCubit() : super(DetectQuestionInitialStates());
  static DetectQuestionCubit get(context) => BlocProvider.of(context);
  List<String> answersList = [];
  void getQuestion({required String questionAndAnswer}) {
    emit(DetectQuestionLoadingStates());
    final String question =
        questionAndAnswer.substring(0, questionAndAnswer.indexOf('?') + 1);
    final int indexOfQuestionMark = questionAndAnswer.indexOf('?');
    final String answers = questionAndAnswer.substring(
        indexOfQuestionMark + 2, questionAndAnswer.lastIndexOf(''));
    final String firstAnswer =
        'a. ${answers.substring(0, answers.indexOf('b.') - 1)}';
    final int indexOfFirstAnswer = answers.indexOf('b.');
    answersList.add(firstAnswer);
    final String secondAnswer =
        answers.substring(indexOfFirstAnswer, answers.indexOf('c.'));
    final int indexOfSecondAnswer = answers.indexOf('c.');
    answersList.add(secondAnswer);
    final String thirdAnswer =
        answers.substring(indexOfSecondAnswer, answers.indexOf('d.'));
    answersList.add(thirdAnswer);
    final String fourthAnswer = answers.substring(59, answers.lastIndexOf(''));
    answersList.add(fourthAnswer);
    emit(DetectQuestionSuccessStates(question, answersList));
  }
}
