import 'package:astroapp/planet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'galleryImage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PlanetDetails extends StatefulWidget {
  PlanetDetails({Key? key, this.image, this.index, required this.planet})
      : super(key: key);

  final image, index, planet;

  @override
  _PlanetDetailsState createState() => _PlanetDetailsState();
}

class _PlanetDetailsState extends State<PlanetDetails>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Matrix4 matrix = Matrix4.identity();
  String planetName = '';
  List<bool> isSelected1 = [false];
  List<bool> isSelected2 = [false];
  List<bool> isSelected3 = [false];

  @override
  Widget build(BuildContext context) {
    Planet planet = widget.planet;
    return Scaffold(
        body: SizedBox(
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Hero(
              tag: "tag" + widget.index.toString(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(planet.name == "Mercury"
                      ? "assets/images/planets_images/mercury.jpeg"
                      : planet.name == "Venus"
                          ? "assets/images/planets_images/venus.jpg"
                          : planet.name == "Earth"
                              ? "assets/images/planets_images/earth.jpg"
                              : planet.name == "Mars"
                                  ? "assets/images/planets_images/mars.jpg"
                                  : planet.name == "Jupiter"
                                      ? "assets/images/planets_images/jupiter.jpg"
                                      : planet.name == "Saturn"
                                          ? "assets/images/planets_images/saturn.jpg"
                                          : planet.name == "Uranus"
                                              ? "assets/images/planets_images/uranus.jpg"
                                              : planet.name == "Neptune"
                                                  ? "assets/images/planets_images/neptune.jpg"
                                                  : "assets/images/planets_images/sun.png"),
                  fit: BoxFit.cover,
                )),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 10, 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.height,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Material(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              planet.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Milkyway Galaxy",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SizedBox(
                      height: 45,
                      child: TabBar(
                        indicatorPadding:
                            const EdgeInsets.fromLTRB(80, 0, 80, 0),
                        controller: _tabController,
                        tabs: [
                          Tab(
                              child: Text(
                            'Overview',
                            style: Theme.of(context).textTheme.bodyText2,
                          )),
                          Tab(
                            child: Text(
                              'Facts',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const BouncingScrollPhysics(
                          parent: NeverScrollableScrollPhysics()),
                      controller: _tabController,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 0, 12, 12),
                                child: Text(
                                  planet.description,
                                )),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Divider(
                                thickness: 1,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                'Gallery',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                child: ListView(
                                  physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  // This next line does the trick.
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return GalleryImage(
                                            image: 'assets/' +
                                                widget.index.toString() +
                                                '/1.jpg',
                                          );
                                        }));
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/' +
                                              widget.index.toString() +
                                              '/1.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return GalleryImage(
                                            image: 'assets/' +
                                                widget.index.toString() +
                                                '/2.jpg',
                                          );
                                        }));
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/' +
                                              widget.index.toString() +
                                              '/2.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return GalleryImage(
                                            image: 'assets/' +
                                                widget.index.toString() +
                                                '/3.jpg',
                                          );
                                        }));
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/' +
                                              widget.index.toString() +
                                              '/3.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                'Trip Inclusion',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ToggleButtons(
                                  borderRadius: BorderRadius.circular(200),
                                  borderWidth: 0,
                                  isSelected: isSelected2,
                                  onPressed: (int index) {
                                    setState(() {
                                      isSelected2[index] = !isSelected2[index];
                                      isSelected3[index] = false;
                                      isSelected1[index] = false;
                                    });
                                  },
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(8),
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                      child: Column(
                                        children: const [
                                          Icon(Icons.window_outlined),
                                          Text("Space view")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(width: 10),
                                ToggleButtons(
                                  borderRadius: BorderRadius.circular(200),
                                  borderWidth: 0,
                                  isSelected: isSelected1,
                                  onPressed: (int index) {
                                    setState(() {
                                      isSelected1[index] = !isSelected1[index];
                                      isSelected2[index] = false;
                                      isSelected3[index] = false;
                                    });
                                  },
                                  children: [
                                    Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                      margin: const EdgeInsets.all(8),
                                      child: Column(
                                        children: const [
                                          Icon(Icons.wifi),
                                          Text("Free Wifi")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(width: 10),
                                ToggleButtons(
                                  borderRadius: BorderRadius.circular(200),
                                  borderWidth: 0,
                                  isSelected: isSelected3,
                                  onPressed: (int index) {
                                    setState(() {
                                      isSelected3[index] = !isSelected3[index];
                                      isSelected2[index] = false;
                                      isSelected1[index] = false;
                                    });
                                  },
                                  children: [
                                    Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                      margin: const EdgeInsets.all(8),
                                      child: Column(
                                        children: const [
                                          Icon(Icons.fastfood),
                                          Text("Free Beverages")
                                        ],
                                      )
                                    )
                                  ]
                                )
                              ]
                            ),
                            Expanded(child: Container()),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                color: Colors.transparent,
                                child: AnimatedContainer(
                                  height: 100,
                                  width: 100,
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.easeIn,
                                  child: Material(
                                    color: Colors.blueGrey[900],
                                    child: InkWell(
                                      highlightColor: Colors.blueGrey[900],
                                      splashColor: Colors.blueGrey[700],
                                      onTap: () {},
                                      child: const Center(
                                        child: Text(
                                          "Book Travel",
                                          style: TextStyle(
                                              wordSpacing: 2,
                                              letterSpacing: 0.7,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                          ]
                        ),
                        ListView(
                          children: [
                            const SizedBox(
                              height: 22,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:70,
                                decoration: const BoxDecoration(
                                    color: Color(0xff383838),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35))),
                                child: Padding(padding:const EdgeInsets.fromLTRB(30, 0, 20, 0),child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                   const GlowIcon(
                                      Icons.speed_sharp,
                                      color: Colors.white,
                                      glowColor: Colors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(30, 10, 10, 8),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                           const Padding(
                                              padding:  EdgeInsets.only(bottom: 8),
                                              child: Text("Average Orbital Speed",style: TextStyle(
                                                color: Color(0xAFADADFF)
                                              ),),
                                            ),
                                            Text(planet.velocity + " Km/s",style: const TextStyle(color: Colors.white),)
                                        ],
                                      ),
                                    )
                                  ],
                                ),),
                              ),
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:70,
                                decoration: const BoxDecoration(
                                    color: Color(0xff383838),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35))),
                                child: Padding(padding:const EdgeInsets.fromLTRB(30, 0, 20, 0),child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                   const GlowIcon(
                                      FontAwesomeIcons.solidMoon,
                                      color: Colors.white,
                                      glowColor: Colors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(30, 10, 10, 8),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                           const Padding(
                                              padding:  EdgeInsets.only(bottom: 8),
                                              child: Text("Moons Count",style: TextStyle(
                                                color: Color(0xAFADADFF)
                                              ),),
                                            ),
                                            Text(planet.moons + " moons",style: const TextStyle(color: Colors.white))
                                        ],
                                      ),
                                    )
                                  ],
                                ),),
                              ),
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:70,
                                decoration: const BoxDecoration(
                                    color: Color(0xff383838),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                                child: Padding(padding:const EdgeInsets.fromLTRB(30, 0, 20, 0),child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const GlowIcon(
                                      Icons.format_list_numbered_outlined,
                                      color: Colors.white,
                                      glowColor: Colors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(30, 10, 10, 8),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding:  EdgeInsets.only(bottom: 8),
                                            child: Text("Position from Sun",style: TextStyle(
                                                color: Color(0xAFADADFF)
                                            ),),
                                          ),
                                          Text(planet.position,style: const TextStyle(color: Colors.white))
                                        ],
                                      ),
                                    )
                                  ],
                                ),),
                              ),
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:70,
                                decoration: const BoxDecoration(
                                    color: Color(0xff383838),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                                child: Padding(padding:const EdgeInsets.fromLTRB(30, 0, 20, 0),child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const GlowIcon(
                                      Icons.timer,
                                      color: Colors.white,
                                      glowColor: Colors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(30, 10, 10, 8),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding:  EdgeInsets.only(bottom: 8),
                                            child: Text("Rotational Duration",style: TextStyle(
                                                color: Color(0xAFADADFF)
                                            ),),
                                          ),
                                          Text(planet.rotation.toString() + " hours",style: const TextStyle(color: Colors.white))
                                        ],
                                      ),
                                    )
                                  ],
                                ),),
                              ),
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:70,
                                decoration: const BoxDecoration(
                                    color: Color(0xff383838),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                                child: Padding(padding:const EdgeInsets.fromLTRB(30, 0, 20, 0),child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const GlowIcon(
                                      Icons.space_bar,
                                      color: Colors.white,
                                      glowColor: Colors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(30, 10, 10, 8),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding:  EdgeInsets.only(bottom: 8),
                                            child: Text("Distance from Sun",style: TextStyle(
                                                color: Color(0xAFADADFF)
                                            ),),
                                          ),
                                          Text(planet.distance + " million Km",style: const TextStyle(color: Colors.white))
                                        ],
                                      ),
                                    )
                                  ],
                                ),),
                              ),
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:70,
                                decoration: const BoxDecoration(
                                    color: Color(0xff383838),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                                child: Padding(padding:const EdgeInsets.fromLTRB(30, 0, 20, 0),child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const GlowIcon(
                                      Icons.line_weight_sharp,
                                      color: Colors.white,
                                      glowColor: Colors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(30, 10, 10, 8),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding:  EdgeInsets.only(bottom: 8),
                                            child: Text("Mass",style: TextStyle(
                                                color: Color(0xAFADADFF)
                                            ),),
                                          ),
                                          Text(planet.mass + " Kg x 10^24",style: const TextStyle(color: Colors.white))
                                        ],
                                      ),
                                    )
                                  ],
                                ),),
                              ),
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:70,
                                decoration: const BoxDecoration(
                                    color: Color(0xff383838),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                                child: Padding(padding:const EdgeInsets.fromLTRB(30, 0, 20, 0),child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const GlowIcon(
                                      FontAwesomeIcons.arrowsAltH,
                                      color: Colors.white,
                                      glowColor: Colors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(30, 10, 10, 8),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding:  EdgeInsets.only(bottom: 8),
                                            child: Text("Planet Diameter",style: TextStyle(
                                                color: Color(0xAFADADFF)
                                            ),),
                                          ),
                                          Text(planet.diameter + " Km",style: const TextStyle(color: Colors.white))
                                        ],
                                      ),
                                    )
                                  ],
                                ),),
                              ),
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:70,
                                decoration: const BoxDecoration(
                                    color: Color(0xff383838),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                                child: Padding(padding:const EdgeInsets.fromLTRB(30, 0, 20, 0),child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const GlowIcon(
                                      FontAwesomeIcons.longArrowAltDown,
                                      color: Colors.white,
                                      glowColor: Colors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(30, 10, 10, 8),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding:  EdgeInsets.only(bottom: 8),
                                            child: Text("Planet Gravity",style: TextStyle(
                                                color: Color(0xAFADADFF)
                                            ),),
                                          ),
                                          Text(planet.gravity + " m/s^2",style: const TextStyle(color: Colors.white))
                                        ],
                                      ),
                                    )
                                  ],
                                ),),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ]),
      ),
    ));
  }
}
