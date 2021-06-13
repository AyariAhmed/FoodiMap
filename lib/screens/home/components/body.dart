import 'package:flutter/material.dart';
import 'package:foodimap_flutter/screens/home/components/search_field.dart';
import 'package:foodimap_flutter/size_config.dart';

import 'icon_btn_with_counter.dart';

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
          Padding(
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
          )
        ],
      ),
    ));
  }
}



