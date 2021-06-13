import 'package:flutter/material.dart';
import 'package:foodimap_flutter/components/custom_suffix_icon.dart';
import 'package:foodimap_flutter/components/default_button.dart';
import 'package:foodimap_flutter/components/form_error.dart';
import 'package:foodimap_flutter/screens/login_success/login_success_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  String email_phone;
  String password;
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(32),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          Row(
            children: [
              Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  }),
              Text("Se souvenir de moi")
            ],
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          DefaultButton(
              text: "Continuer",
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                }
              }),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    const emailTelValidation =
        "Prière d'ajouter votre Email ou Numéro de Téléphone";
    return TextFormField(
      onSaved: (newValue) => email_phone = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(emailTelValidation)) {
          setState(() {
            errors.remove(emailTelValidation);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(emailTelValidation)) {
          setState(() {
            errors.add(emailTelValidation);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email/Numéro de telephone",
          hintText: "Email/Télephone",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffix(svgIcon: "assets/icons/Mail.svg")),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 6 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } else if (value.length < 6 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Mot de passe",
          hintText: "Mot de passe",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffix(svgIcon: "assets/icons/Lock.svg")),
    );
  }
}
