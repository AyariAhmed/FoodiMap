import 'package:flutter/material.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20)
      ),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15)
      ),
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
          color: Color(0xFF4A3298),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Text.rich(
          TextSpan(
              text: "Offre Spéciale pour les étudiants\n",
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                    text : "-20% sur tous les repas",
                    style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)
                )
              ]
          )
      ),
    );
  }
}
