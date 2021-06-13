import 'package:flutter/material.dart';
import 'package:foodimap_flutter/components/custom_suffix_icon.dart';
import 'package:foodimap_flutter/components/default_button.dart';
import 'package:foodimap_flutter/components/form_error.dart';
import 'package:foodimap_flutter/constants.dart';
import 'package:foodimap_flutter/screens/sign_in/components/sign_form.dart';
import 'package:foodimap_flutter/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Bon Retour Chez Nous!',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(25),
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                  child: Text(
                    "Identifiez Vous avec votre Email/Num de telephone et votre mot de passe",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05,),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.07,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Vous n'avez pas de compte ?",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16)),
                    ),Text(
                      "Créer un compte",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          color: kPrimaryColor
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
