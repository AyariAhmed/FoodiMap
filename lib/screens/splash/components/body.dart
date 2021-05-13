import 'package:flutter/material.dart';
import 'package:foodimap_flutter/components/default_button.dart';
import 'package:foodimap_flutter/constants.dart';
import 'package:foodimap_flutter/screens/splash/components/splash_content.dart';
import 'package:foodimap_flutter/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Bienvenue dans notre Plateforme,\n Commandons quelques repas !",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "Chez nous, Votre repas préféré viens à vos main ",
      "image": "assets/images/splash_3.png"
    },
    {
      "text":
          "Ennuyé du temps d'attente chez les restos?\n Essayer notre application !",
      "image": "assets/images/splash_2.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]["text"],
                  image: splashData[index]["image"],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        children: List.generate(splashData.length,
                            (index) => buildDot(index: index)),
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      DefaultButton(text: "Continuer",press: (){},),
                      Spacer()
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}

