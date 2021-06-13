import 'package:flutter/material.dart';
import 'package:foodimap_flutter/screens/home/components/section_title.dart';
import 'package:foodimap_flutter/size_config.dart';
import 'best_rated_section.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          HomeHeader(),
          SizedBox(
            height: getProportionateScreenWidth(25),
          ),
          DiscountBanner(),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),

          BestRated()
        ],
      ),
    ));
  }
}

class BestRated extends StatelessWidget {
  const BestRated({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: 'Les Mieux Notés',
          press: () {
            // voir plus
          },
        ),
        SizedBox(height: getProportionateScreenWidth(10),),
        SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SpecialOfferCard(image: "assets/images/burger.jpg",name: "Burger",rating: 4.2,press: (){},),
            SpecialOfferCard(image: "assets/images/salad.jpg",name: "Salad",rating: 3.8,press: (){},),
            SpecialOfferCard(image: "assets/images/soup.jpg",name: "Soup",rating: 3.5,press: (){},),
            SpecialOfferCard(image: "assets/images/pizza.jpg",name: "Pizza",rating: 4.5,press: (){},),
            SizedBox(width: getProportionateScreenWidth(20),)
          ],
        ),
      )],
    );
  }
}


