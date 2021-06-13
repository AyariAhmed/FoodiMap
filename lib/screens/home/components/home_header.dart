import 'package:flutter/material.dart';
import 'package:foodimap_flutter/screens/home/components/search_field.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconButtonWithCounter(
            SvgSrc: "assets/icons/Cart Icon.svg",
            count: 0,
            press: () {
              // To Implement
            },
          ),
          IconButtonWithCounter(
            SvgSrc: "assets/icons/Bell.svg",
            count: 3,
            press: () {
              // To Implement
            },
          )
        ],
      ),
    );
  }
}
