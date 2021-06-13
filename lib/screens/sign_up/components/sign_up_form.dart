import 'package:flutter/material.dart';
import 'package:foodimap_flutter/components/custom_suffix_icon.dart';
import 'package:foodimap_flutter/components/default_button.dart';
import 'package:foodimap_flutter/components/form_error.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final _formKey = GlobalKey<FormState>();
  String email;
  String phone;
  String password;
  String confirm_password;

  final List<String> errors = [];


  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [

          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(19),
          ),
          buildPhoneFormField(),
          SizedBox(
            height: getProportionateScreenHeight(19),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(19),
          ),
          buildConfirmPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(19),
          ),
          FormError(errors: errors),

          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          DefaultButton(text: "Continuer", press: (){
            if(_formKey.currentState.validate()){
              // Redirection vers complete Profile page
            }
          }),

        ],));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        }else if (!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)){
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Entrer votre Email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffix(svgIcon: "assets/icons/Mail.svg")),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      onSaved: (newValue) => phone = newValue,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPhoneNullError)) {
          setState(() {
            errors.remove(kPhoneNullError);
          });
        }
        if((phoneValidatorRegExp.hasMatch(value)) && errors.contains(kInvalidPhoneError)){
          setState(() {
            errors.remove(kInvalidPhoneError);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPhoneNullError)) {
          setState(() {
            errors.add(kPhoneNullError);
          });
          return "";
        }
        if((value.length != 8 || !phoneValidatorRegExp.hasMatch(value)) && !errors.contains(kInvalidPhoneError)){
          setState(() {
            errors.add(kInvalidPhoneError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Téléphone",
          hintText: "Entrer votre Téléphone",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffix(svgIcon: "assets/icons/Phone.svg")),
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
        } if (value.length >= 6 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } if (value.length < 6 && !errors.contains(kShortPassError)) {
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
  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kConfirmPassNullError)) {
          setState(() {
            errors.remove(kConfirmPassNullError);
          });
        }
        if(password == confirm_password && errors.contains(kMatchPassError)){
          setState(() {
            errors.remove(kMatchPassError);
          });
        }
        confirm_password = value;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kConfirmPassNullError)) {
          setState(() {
            errors.add(kConfirmPassNullError);
          });
          return "";
        }if(password != confirm_password && !errors.contains(kMatchPassError)){
          setState(() {
            errors.add(kMatchPassError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Confirmation mot de passe",
          hintText: "Resaisir Mot de passe",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffix(svgIcon: "assets/icons/Lock.svg")),
    );
  }
}