// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pokemon {
  final int id;
  final String num;
  final String name;
  final String img;
  final List type;
  final String height;
  final String weight;
  final String egg;
  final List weaknesses;
  final List prev_evolution;
  final List next_evolution;
  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.egg,
    required this.weaknesses,
    required this.prev_evolution,
    required this.next_evolution,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['num'] = num;
    map['name'] = name;
    map['image'] = img;
    map['type'] = type;
    map['height'] = height;
    map['width'] = weight;
    map['eggs'] = egg;
    map['weaknesses'] = weaknesses;
    map['prev_evolution'] = prev_evolution;
    map['next_evolution'] = next_evolution;
    return map;
  }
}


// "prev_evolution": [{
//   "num": "001",
//   "name": "Bulbasaur"
// }],
// "next_evolution": [{
//   "num": "003",
//   "name": "Venusaur"
// }]