import 'package:flutter/material.dart';
import 'package:foodimap_flutter/size_config.dart';
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
          SizedBox(height: getProportionateScreenWidth(20),),
          HomeHeader(),
          SizedBox(height: getProportionateScreenWidth(25),),
          DiscountBanner(),
          SizedBox(height: getProportionateScreenWidth(20),),

        ],
      ),
    ));
  }
}

class Categories extends StatelessWidget {
  const Categories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}




