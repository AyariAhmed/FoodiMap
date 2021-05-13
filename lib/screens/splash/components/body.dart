import 'package:flutter/material.dart';
import 'package:foodimap_flutter/screens/splash/components/splash_content.dart';


class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> splashData = [
    {"text":"Bienvenue dans notre Plateforme,\n Commandons quelques repas !","image":"assets/images/splash_1.png"},
    {"text":"Chez nous, Votre repas préféré viens à vos main ","image":"assets/images/splash_3.png"},
    {"text":"Ennuyé du temps d'attente chez les restos?\n Essayer notre application !","image":"assets/images/splash_2.png"}
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
                itemCount: splashData.length,
                itemBuilder: (context, index) =>
                    SplashContent(
                      text: splashData[index]["text"],
                      image: splashData[index]["image"],
                    ),
              ),
            ),
            Expanded(flex: 2, child: SizedBox())
          ],
        ),
      ),
    );
  }
}

