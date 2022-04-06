class Planet {
  String position = '';
  String name = '';
  String image='';
  String velocity='';
  String mass='';
  String diameter='';
  String gravity='';
  String moons='';
  String rotation='';
  String distance='';
  String description='';

  Planet(
      {required this.position,
        required this.name,
        required this.image,
        required this.velocity,
        required this.mass,
        required this.diameter,
        required this.gravity,
        required this.moons,
        required this.rotation,
        required this.distance,
        required this.description});

  Planet.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    name = json['name'];
    image = json['image'];
    velocity = json['velocity'];
    mass = json['mass'];
    diameter = json['diameter'];
    gravity = json['gravity'];
    moons = json['moons'];
    rotation = json['rotation'];
    distance = json['distance'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    data['name'] = this.name;
    data['image'] = this.image;
    data['velocity'] = this.velocity;
    data['mass'] = this.mass;
    data['diameter'] = this.diameter;
    data['gravity'] = this.gravity;
    data['moons'] = this.moons;
    data['distance'] = this.distance;
    data['description'] = this.description;
    return data;
  }
}