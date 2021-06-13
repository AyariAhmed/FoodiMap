import 'package:flutter/material.dart';
import 'package:foodimap_flutter/components/custom_suffix_icon.dart';
import 'package:foodimap_flutter/constants.dart';
import 'package:foodimap_flutter/size_config.dart';


class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text("Créer un Compte",style: headingStyle,),
            Text('Complétez vos coordonnées',textAlign: TextAlign.center,),
            SignUpForm(),

          ],
        ),
      ),
    );
  }
}


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
  String Confirm_password;

  final List<String> errors = [];


  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
            buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
            buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
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
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Email/Télephone",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: customSuffix(svgIcon: "assets/icons/Mail.svg")),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      onSaved: (newValue) => phone = newValue,
      keyboardType: TextInputType.number,
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
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
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
