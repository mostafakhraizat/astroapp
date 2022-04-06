import 'dart:convert';
import 'package:astroapp/planet.dart';
import 'package:astroapp/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  TextEditingController editingController = TextEditingController();
  final now = DateTime.now();
  DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  final a = DateFormat('EEEE').format(DateTime.now());
  List<Planet> planets = [];
  List<Planet> _filteredList = [];
  TextEditingController controller = TextEditingController();
  String filter = "";
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat(reverse: true);
  late final Animation<Offset> animation =
      Tween(begin: const Offset(0, -0.04), end: const Offset(0, 0.04))
          .animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    loadAsset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if ((filter.isNotEmpty)) {
      List<Planet> tmpList = [];
      for (int i = 0; i < _filteredList.length; i++) {
        if (_filteredList[i]
            .name
            .toLowerCase()
            .contains(filter.toLowerCase())) {
          tmpList.add(_filteredList[i]);
        }
      }
      _filteredList = tmpList;
    }
    return Material(
      type: MaterialType.transparency,

      child: Scaffold(
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/back.jpg"),
                fit: BoxFit.cover,
              )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),

                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            child:   const Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                            ),
                          ),
                        ),
                      ),
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Text(
                            a +
                                ", " +
                                DateTime.now().day.toString() +
                                " " +
                                convertToMonths(DateTime.now().month.toString()) +
                                " " +
                                DateTime.now().year.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Hero(
                            tag: 'Detailed',
                            child: Text(
                              "Detailed",
                              style: TextStyle(
                                color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: FutureBuilder(
                        future: loadAsset(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            Iterable l = json.decode(snapshot.data.toString());
                            List<Planet> planets = List<Planet>.from(
                                l.map((model) => Planet.fromJson(model)));
                            return ListView.builder(
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                padding: const EdgeInsets.all(8),
                                itemCount: planets.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          Routing().createRoute(PlanetDetails(
                                        planet: planets.elementAt(index),
                                        image: planets.elementAt(index).image,
                                        index: index,
                                      )));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(
                                        children: <Widget>[
                                          Card(
                                            color:Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Colors.white70,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            margin:
                                                const EdgeInsets.only(top: 70.0),
                                            child: SizedBox(
                                                width: double.infinity,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 25.0,
                                                              left: 88),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Text(
                                                            planets
                                                                .elementAt(index)
                                                                .name,
                                                            style:
                                                                Theme.of(context)
                                                                    .textTheme
                                                                    .headline6,
                                                          ),
                                                          const SizedBox(
                                                            height: 14,
                                                          ),
                                                          Text(
                                                            "Milkyway Galaxy",
                                                            style:
                                                                Theme.of(context)
                                                                    .textTheme
                                                                    .bodyText1,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20,
                                                              left: 45,
                                                              bottom: 25,
                                                              right: 45),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Flexible(
                                                              child: Text(planets
                                                                          .elementAt(
                                                                              index)
                                                                          .description
                                                                          .length >
                                                                      100
                                                                  ? planets
                                                                          .elementAt(
                                                                              index)
                                                                          .description
                                                                          .substring(
                                                                              0,
                                                                              100) +
                                                                      "..."
                                                                  : planets
                                                                      .elementAt(
                                                                          index)
                                                                      .description,style: TextStyle(
                                                                color: Colors.black
                                                              ),))
                                                        ],
                                                      ),
                                                    ),
                                                    const Divider(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 30),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                planets
                                                                        .elementAt(
                                                                            index)
                                                                        .distance
                                                                        .toString() +
                                                                    " KM",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .button,
                                                              ),
                                                              Text(
                                                                "From Sun",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .caption,
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            width: 25,
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  planets
                                                                          .elementAt(
                                                                              index)
                                                                          .velocity
                                                                          .toString() +
                                                                      " km/s",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .button),
                                                              Text("Velocity",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .caption),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            width: 25,
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  planets
                                                                      .elementAt(
                                                                          index)
                                                                      .position,
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .button),
                                                              Text("Position/Sun",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .caption),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            width: 25,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 14,
                                                          left: 40,
                                                          right: 40,
                                                          bottom: 14),
                                                      child: Divider(
                                                      ),
                                                    )
                                                  ],
                                                )),
                                          ),
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 160,
                                            child: SlideTransition(
                                              position: animation,
                                              child: Center(
                                                child: Hero(
                                                  tag: "tag" + index.toString(),
                                                  child: CircleAvatar(
                                                    child: Image(
                                                        image: AssetImage(
                                                          planets
                                                              .elementAt(index)
                                                              .image,
                                                        ),
                                                        fit: BoxFit.cover),
                                                    radius: 80.0,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            return Container();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ))),
    );
  }

  String convertToMonths(String monthNb) {
    if (monthNb == '1') {
      return "Jan";
    } else if (monthNb == '2') {
      return "Feb";
    } else if (monthNb == '3') {
      return "Mar";
    } else if (monthNb == '4') {
      return "Apr";
    } else if (monthNb == '5') {
      return "May";
    } else if (monthNb == '6') {
      return "Jun";
    } else if (monthNb == '7') {
      return "Jul";
    } else if (monthNb == '8') {
      return "Aug";
    } else if (monthNb == '9') {
      return "Sep";
    } else if (monthNb == '10') {
      return "Oct";
    } else if (monthNb == '11') {
      return "Nov";
    } else {
      return "Dec";
    }
  }

  Future<String> loadAsset() async {
    String s = await rootBundle.loadString('assets/images/planets.json');

    return s;
  }
}
