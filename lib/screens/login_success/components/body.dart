import 'package:flutter/material.dart';
import 'package:foodimap_flutter/components/default_button.dart';
import 'package:foodimap_flutter/screens/home/home_screen.dart';
import 'package:foodimap_flutter/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.04,
        ),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4,
          width: double.infinity,
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.07,
        ),
        Text(
          'Authentification Réussite',
          style: TextStyle(fontSize: getProportionateScreenWidth(25),
          fontWeight: FontWeight.bold
          ),

        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(text: "Aller à l'accueil", press: (){
            Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.routeName,(Route<dynamic> route) => false);
          }),
        ),
        Spacer()
      ],
    );
  }
}
