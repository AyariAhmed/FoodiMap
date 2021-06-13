import 'package:flutter/material.dart';
import 'package:foodimap_flutter/size_config.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
    fontSize: getProportionateScreenWidth(24),
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.5

);

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp phoneValidatorRegExp = RegExp(r"^\d{8}$");
final RegExp dateValidatorRegExp = RegExp(r"^(19|20)\d\d(-)(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$");
const String kDateFormatError = "Priére d'entrer une date avec la format yyyy-mm-dd (exemple 1999-05-17)";
const String kEmailNullError = "Priére d'ajouter votre adresse email";
const String kInvalidEmailError = "Priére d'ajouter une adresse email valide";
const String kPassNullError = "Priére d'ajouter votre mot de passe";
const String kConfirmPassNullError = "Priére de confirmer votre mot de passe";
const String kPhoneNullError = "Priére d'ajouter votre numéro de téléphone";
const String kInvalidPhoneError = "Priére d'ajouter un numéro de téléphone valide";
const String kShortPassError = "Votre mot de passe est trés court";
const String kMatchPassError = "Les mots de passe ne correspondent pas";
const String kNamelNullError = "Priére d'ajouter votre nom";
const String kPhoneNumberNullError = "Priére d'ajouter votre numéro de Téléphone";
const String kAddressNullError = "Priére d'ajouter votre adresse";