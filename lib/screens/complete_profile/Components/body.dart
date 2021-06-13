import 'package:flutter/material.dart';
import 'package:foodimap_flutter/components/custom_suffix_icon.dart';
import 'package:foodimap_flutter/constants.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text('Compléter Votre Profil',style: headingStyle,),
            Text('Complétez vos coordonnées',textAlign: TextAlign.center,),
            CompleteProfilForm()
          ],
        ),
      ),
    );
  }
}

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
            buildLastNameFormField(),
            SizedBox(
              height: getProportionateScreenHeight(19),
            ),
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
          labelText: "Date Naissance",
          hintText: "Format date YYYY-MM-DD",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffix(svgIcon: "assets/icons/User.svg")),
    );
  }
}
