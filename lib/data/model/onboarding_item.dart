class OnBoardingItem {
  late String image;
  String? description;
  String? title;

  OnBoardingItem(
      { this.title, required this.image, this.description});
}

abstract class Constant{
  static const String haveSeenBefore= "haveSeenBefore";
  static List<OnBoardingItem> boardingItems = [
    OnBoardingItem(
        image: 'assets/images/Onboarding Screen 1.png',  description: 'SQ helps you if you are confused of your answers and check your answers'),
    OnBoardingItem(
        image: 'assets/images/Onboarding Screen 2.png', description: 'You can also  know the precentage of each answer'),
    OnBoardingItem(
        image: 'assets/images/Onboarding Screen 3.png', description: 'All stored data is trusted data and you can scan with confidence',),
  ];
}