import 'package:flutter/material.dart';
import 'package:foodimap_flutter/constants.dart';
import 'package:foodimap_flutter/screens/sign_up/components/sign_up_form.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Créer un Compte",style: headingStyle,),
              Text('Complétez vos coordonnées',textAlign: TextAlign.center,),
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              SignUpForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Text('En continuant vous acceptez notre politique de confidentialité .',
                textAlign: TextAlign.center,

              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),

            ],
          ),
        ),
      ),
    );
  }
}



