import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';

import '../languages/app_local.dart';

class AppValidateStrings {
  static const enterYourName = 'Enter Your Name';
  static const enterYourDOB = 'Enter Your Date of Birth';
  static const enterYourPassword = 'Enter Your Password';
  static const nameMustBe = 'Name Must be more than 3 character';
  static const passwordMustBe = 'Must be at least 8 characters in length';
  static const passwordMustBeUpperChar = 'Must contain at least one uppercase';
  static const passwordMustBeLowerChar = 'Must contain at least one lowercase';
  static const passwordMustBeNumber = 'Must contain at least one digit';
  static const passwordSameAbove = 'Password must be same as above';
  static const passwordMustBeSpecialChar =
      'Contain at least one special character: !@#&*~';
  static const enterYourEmail = 'Enter Your Email';
  static const validEmail = 'Please enter valid  email';
  static const enterYourPhoneNum = 'Enter Your Phone Number';
  static const enterValidNum = 'Enter valid phone number';
  static const enterYourMessage =                 'Enter Your Message';
  static const messageMustBe =                    'Message Must be more than 10 character';
  static const enterYourGender =                  'Please select your gender';
  static const enterPinCode =                     'Please enter code';
  static const pinCodeMustBe =                    'Code must be 4 numbers';
  static const selectCity =                       'Please select your city';
  static const enterRegion =                      'Please enter your region';
  static const regionMustBe =                     'Region must be at least 5 character';
  static const streetAddressMustBe =
                                                  'Street address must be at least 5 character';
  static const buildingMustBe =                   'Building must be at least 5 character';
  static const landmarkMustBe =                   'Landmark must be at least 5 character';
  static const enterStreetAddress =               'Please enter your street address';
  static const enterBuilding =                    'Please enter your building';
  static const enterFloor =                       'Please enter your floor';
  static const enterLandmark =                    'Please enter your landmark';
}

class AppValidate {
  static String? validateName(String value, context) {
    if (value.isEmpty) {
      return AppValidateStrings.enterYourName;
    }

    if (value.length < 3) {
      return AppValidateStrings.nameMustBe;
    }
    // if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
    //   return AppValidateStrings.nameMustBe;
    // }
    else {
      return null;
    }
  }
  static String? validateMessage(String value, context) {
    if (value.isEmpty) {
      return AppValidateStrings.enterYourMessage;
    }
    if (value.length < 10) {
      return AppValidateStrings.messageMustBe;
    }
    return null;
  }
  static String? validateEmail(String value, context) {
    if (value.isEmpty) {
      return AppValidateStrings.enterYourEmail;
    }
    if (EmailValidator.validate(value) != true) {
      return AppValidateStrings.validEmail;
    } else {
      return null;
    }
  }

  static String? validatePassword(String value, context) {
    if (value.isEmpty) {
      return AppValidateStrings.enterYourPassword;
    }
    if (value.length < 8) {
      return AppValidateStrings.passwordMustBe;
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return AppValidateStrings.passwordMustBeLowerChar;
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return AppValidateStrings.passwordMustBeUpperChar;
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return AppValidateStrings.passwordMustBeNumber;
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return AppValidateStrings.passwordMustBeSpecialChar;
    }

    return null;
  }

  static String? validateConfirmPassword(
      String value,
      TextEditingController passController,
      TextEditingController confirmPassController,
      context) {
    if (value.isEmpty) {
      return AppValidateStrings.enterYourPassword;
    }
    if (passController.text != confirmPassController.text) {
      return AppValidateStrings.passwordSameAbove;
    }
    return null;
  }

  static String? validatePhone(String value, context) {
    if (value.isEmpty) {
      return AppValidateStrings.enterYourPhoneNum;
    }
    if (!RegExp(r'^01[0-2,5]{1}[0-9]{8}$').hasMatch(value)) {
      return AppValidateStrings.enterValidNum;
    }
    return null;
  }

  static String? validateDateOfBirth(String value, context) {
    if (value.isEmpty) {
      return AppValidateStrings.enterYourDOB;
    }
    return null;
  }

  static String? validatePinCode(String value , context) {
    if (value.isEmpty) {
      return AppValidateStrings.enterPinCode;
    }
    if (value.length < 4) {
      return AppValidateStrings.pinCodeMustBe;
    }
    return null;
  }

  static dynamic validateGender(value, context) {
    if (value == null) {
      return AppValidateStrings.enterYourGender;
    }
    return null;
  }

  static String? validateCity(value, context) {
    if (value == null) {
      return AppValidateStrings.selectCity;
    }
    return null;
  }

  static String? validateRegion(String value, context) {
    if (value.isEmpty) {
      return AppValidateStrings.enterRegion;
    }
    if (value.length < 5) {
      return AppValidateStrings.regionMustBe;
    }
    return null;
  }

  static String? validateStreetAddress(String value, context) {
    if (value.isEmpty) {
      return AppValidateStrings.enterStreetAddress;
    }
    if (value.length < 5) {
      return AppValidateStrings.streetAddressMustBe;
    }
    return null;
  }

  static String? validateBuilding(String value, context) {
    if (value.isEmpty) {
      return AppValidateStrings.enterBuilding;
    }
    if (value.length < 5) {
      return AppValidateStrings.buildingMustBe;
    }
    return null;
  }

  static String? validateLandMark(String value, context) {
    if (value.isEmpty) {
      return AppValidateStrings.enterLandmark;
    }
    if (value.length < 5) {
      return AppValidateStrings.landmarkMustBe;
    }
    return null;
  }

  static String? validateFloor(String value, context) {
    if (value.isEmpty) {
      return AppValidateStrings.enterFloor;
    }

    return null;
  }
}
