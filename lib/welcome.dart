import 'package:astroapp/detailed.dart';
import 'package:astroapp/routing.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sweet_snackbar/sweet_snackbar.dart';
import 'package:sweet_snackbar/top_snackbar.dart';

import 'new.dart';
class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/main_back.jpg',
              ),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            const Hero(
              tag: 'tah',

              child: Text(
                "Solar System",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Schyler', fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Lottie.asset('assets/solar_planets.json'),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),

                highlightColor: Colors.white70,
                splashColor: Colors.white70,
                onTap: () {
                  Navigator.of(context).push(Routing().createRoute(const HomePage()));
                },
                child: Container(
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child:   Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Hero(
                          tag: 'Detailed',
                          child: Text(
                            "Detailed",
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontFamily: 'Schyler',
                                fontSize: 20),
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_right_alt_sharp)
                    ]),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                highlightColor: Colors.white70,
                splashColor: Colors.white70,
                onTap: () {
                    showTopSnackBar(context, const CustomSnackBar.success(message: 'Coming soon'
                        '!'),);
                },
                child: Container(
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child:   Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Planets",
                          style: TextStyle(
                              color: Colors.blueGrey[900],
                              fontFamily: 'Schyler',
                              fontSize: 20),
                        ),
                      ),
                      const Icon(Icons.arrow_right_alt_sharp)
                    ]),
                  ),
                ),
              ),
            ),


          ],
        ),
      )),
    );
  }
}
