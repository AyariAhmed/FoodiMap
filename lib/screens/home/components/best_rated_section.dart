import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,@required this.name,@required this.image,@required this.rating,@required this.press
  }) : super(key: key);

  final String name,image;
  final double rating;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(190),
        height: getProportionateScreenWidth(100),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end : Alignment.bottomCenter,
                          colors: [
                            Color(0xFF343434).withOpacity(0.7),
                            Color(0xFF343434).withOpacity(0.45)
                          ])
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15),
                      vertical: getProportionateScreenWidth(10)
                  ),
                  child: Text.rich(
                    TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(text: "$name\n",style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.bold
                          )),
                          TextSpan(text: "Noté $rating/5")
                        ]
                    ),

                  ),
                )
              ],

            )),
      ),
    );
  }
}