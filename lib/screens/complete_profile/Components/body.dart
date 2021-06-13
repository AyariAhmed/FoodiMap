import 'package:flutter/material.dart';
import 'package:foodimap_flutter/constants.dart';

import '../../../size_config.dart';
import 'complete_profile_form.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Compléter Votre Profil',style: headingStyle,),
              Text('Complétez vos coordonnées',textAlign: TextAlign.center,),
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              CompleteProfilForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
              Text('En continuant vous acceptez notre politique de confidentialité .',
                textAlign: TextAlign.center,

              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

