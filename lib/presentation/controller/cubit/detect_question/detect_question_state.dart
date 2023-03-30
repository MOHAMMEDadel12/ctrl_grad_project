abstract class DetectQuestionStates {}

class DetectQuestionInitialStates extends DetectQuestionStates {}

class DetectQuestionLoadingStates extends DetectQuestionStates {}

class DetectQuestionSuccessStates extends DetectQuestionStates {
  final String question;
  final List<String> answersList;

  DetectQuestionSuccessStates(this.question, this.answersList);
}
