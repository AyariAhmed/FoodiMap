import 'package:flutter/material.dart';
import 'package:foodimap_flutter/components/custom_suffix_icon.dart';
import 'package:foodimap_flutter/components/default_button.dart';
import 'package:foodimap_flutter/components/form_error.dart';
import 'package:foodimap_flutter/screens/home/home_screen.dart';
import 'package:foodimap_flutter/screens/login_success/login_success_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfilForm extends StatefulWidget {
  const CompleteProfilForm({Key key}) : super(key: key);

  @override
  _CompleteProfilFormState createState() => _CompleteProfilFormState();
}

class _CompleteProfilFormState extends State<CompleteProfilForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String birthdate; // yyyy-mm-dd format
  // Adresse
  String governorate;
  String municipality;
  String street;
  String location;


  @override
  Widget build(BuildContext context) {
    return Form(
        key : _formKey,
        child: Column(
          children: [
            buildLastNameFormField(),
            SizedBox(
              height: getProportionateScreenHeight(19),
            ),
            buildFirstNameFormField(),
            SizedBox(
              height: getProportionateScreenHeight(19),
            ),
            buildBirthDateFormField(),
            SizedBox(
              height: getProportionateScreenHeight(19),
            ),
            buildGovernorateFormField(),
            SizedBox(
              height: getProportionateScreenHeight(19),
            ),
            buildMunicipalityFormField(),
            SizedBox(
              height: getProportionateScreenHeight(19),
            ),
            buildStreetFormField(),
            SizedBox(
              height: getProportionateScreenHeight(19),
            ),
            SizedBox(
              height: getProportionateScreenHeight(19),
            ),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),
            DefaultButton(text: "Continuer", press: (){
              if(_formKey.currentState.validate()){
                // Redirection vers accueil
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            }),
          ],
        ));
  }



  TextFormField buildFirstNameFormField() {
    const firstNameValidation =
        "Prière d'ajouter votre prénom";
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(firstNameValidation)) {
          setState(() {
            errors.remove(firstNameValidation);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(firstNameValidation)) {
          setState(() {
            errors.add(firstNameValidation);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Prénom",
          hintText: "Entrer votre Prénom",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffix(svgIcon: "assets/icons/User.svg")),
    );
  }
  TextFormField buildLastNameFormField() {
    const laNameValidation =
        "Prière d'ajouter votre nom";
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(laNameValidation)) {
          setState(() {
            errors.remove(laNameValidation);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(laNameValidation)) {
          setState(() {
            errors.add(laNameValidation);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Nom",
          hintText: "Entrer votre Nom",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffix(svgIcon: "assets/icons/User.svg")),
    );
  }

  TextFormField buildBirthDateFormField() {
    const emptyDateValidation =
        "Prière d'ajouter votre date de naissance";
    return TextFormField(
      onSaved: (newValue) => birthdate = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(emptyDateValidation)) {
          setState(() {
            errors.remove(emptyDateValidation);
          });
        }
        if(dateValidatorRegExp.hasMatch(value) && errors.contains(kDateFormatError)){
          setState(() {
            errors.remove(kDateFormatError);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(emptyDateValidation)) {
          setState(() {
            errors.add(emptyDateValidation);
          });
          return "";
        }else if (!dateValidatorRegExp.hasMatch(value) && !errors.contains(kDateFormatError)){
          setState(() {
            errors.add(kDateFormatError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Date de Naissance",
          hintText: "Format YYYY-MM-DD",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffix(svgIcon: "assets/icons/Calendar.svg")),
    );
  }

  TextFormField buildGovernorateFormField() {
    const governorateValidation =
        "Prière d'ajouter votre gouvernorat";
    return TextFormField(
      onSaved: (newValue) => governorate = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(governorateValidation)) {
          setState(() {
            errors.remove(governorateValidation);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(governorateValidation)) {
          setState(() {
            errors.add(governorateValidation);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Gouvernorat",
          hintText: "Exemple Tunis..",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffix(svgIcon: "assets/icons/Location point.svg")),
    );
  }
  TextFormField buildMunicipalityFormField() {
    const municipaliteValidation =
        "Prière d'ajouter votre Municipalité";
    return TextFormField(
      onSaved: (newValue) => municipality= newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(municipaliteValidation)) {
          setState(() {
            errors.remove(municipaliteValidation);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(municipaliteValidation)) {
          setState(() {
            errors.add(municipaliteValidation);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Municipalité",
          hintText: "Exemple Bardo..",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffix(svgIcon: "assets/icons/Location point.svg")),
    );
  }
  TextFormField buildStreetFormField() {
    const streetValidation =
        "Prière d'ajouter votre Rue";
    return TextFormField(
      onSaved: (newValue) => street = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(streetValidation)) {
          setState(() {
            errors.remove(streetValidation);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(streetValidation)) {
          setState(() {
            errors.add(streetValidation);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Rue",
          hintText: "Exemple Rue Rajaa..",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffix(svgIcon: "assets/icons/Location point.svg")),
    );
  }
  TextFormField buildLocationFormField() {
    const locationValidation =
        "Prière d'ajouter votre numéro de maison/appartement";
    return TextFormField(
      onSaved: (newValue) => location = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(locationValidation)) {
          setState(() {
            errors.remove(locationValidation);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(locationValidation)) {
          setState(() {
            errors.add(locationValidation);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Localisation exacte",
          hintText: "Exemple appartement 57",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffix(svgIcon: "assets/icons/Location point.svg")),
    );
  }

}
