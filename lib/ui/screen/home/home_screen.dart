import 'package:flutter_ui_apipokemon/data/api/api.dart';
import 'package:flutter_ui_apipokemon/domain/model/pokemon_modal.dart';
import 'package:flutter_ui_apipokemon/ui/screen/detail/details_object_screen.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Pokemon>> pokemon;

  void initState() {
    pokemon = Api.getPokemon(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Pokedex Generation I"),
        backgroundColor: Color.fromRGBO(255, 170, 0, 1),
      ),*/
      body: Stack(
        children: [
          Positioned(
            top: -60,
            right: -60,
            child: Image.asset(
              'images/pokeball_nex.png',
              width: 200,
              fit: BoxFit.fitWidth,
              color: Color.fromARGB(142, 0, 0, 0),
            ),
          ),
          Positioned(
              top: 75,
              left: 20,
              child: Text(
                "Pokemons Generation I",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )),
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: Column(
              children: [
                FutureBuilder<List<Pokemon>>(
                  future: pokemon,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return Text('No data available');
                      } else {
                        return Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.4,
                            ),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              var id = snapshot.data![index].id;
                              var type = snapshot.data![index].type[0];
                              var name = snapshot.data![index].name;
                              var img = snapshot.data![index].img;
                              var weightP = snapshot.data![index].weight;
                              var heightP = snapshot.data![index].height;
                              return InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: type == 'Grass'
                                          ? Colors.greenAccent
                                          : type == 'Fire'
                                              ? Colors.red[400]
                                              : type == 'Water'
                                                  ? Colors.blue[300]
                                                  : type == 'Bug'
                                                      ? Colors.greenAccent[400]
                                                      : type == 'Normal'
                                                          ? Colors.blueGrey[400]
                                                          : type == 'Poison'
                                                              ? Colors
                                                                  .purple[800]
                                                              : type ==
                                                                      'Electric'
                                                                  ? Colors
                                                                      .yellowAccent
                                                                  : type ==
                                                                          'Ground'
                                                                      ? Colors.brown[
                                                                          400]
                                                                      : type ==
                                                                              'Fighting'
                                                                          ? Colors
                                                                              .brown[600]
                                                                          : type == 'Psychic'
                                                                              ? Colors.pink[400]
                                                                              : type == 'Dragon'
                                                                                  ? Colors.purple[900]
                                                                                  : type == 'Rock'
                                                                                      ? Colors.brown[200]
                                                                                      : type == 'Ice'
                                                                                          ? Colors.lightBlue
                                                                                          : Colors.purple[900],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Stack(
                                      children: [
                                        /* Img - Ball */
                                        Positioned(
                                          bottom: -25,
                                          right: -25,
                                          child: Image.asset(
                                            'images/pokeball.png',
                                            height: 150,
                                            fit: BoxFit.fitWidth,
                                            color:
                                                Colors.white12.withOpacity(0.2),
                                            colorBlendMode: BlendMode.modulate,
                                          ),
                                        ),
                                        /* Name */
                                        Positioned(
                                            top: 10,
                                            left: 8,
                                            child: Text(
                                              name.toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        /* id */
                                        Positioned(
                                          top: 10,
                                          right: 10,
                                          child: Text(
                                            id.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        /* Type Pokemon */
                                        Positioned(
                                          bottom: 10,
                                          left: 8,
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                  top: 4,
                                                  bottom: 4),
                                              child: Text(
                                                type.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                            ),
                                          ),
                                        ),
                                        /* Height */
                                        Positioned(
                                          top: 60,
                                          left: 8,
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                  top: 4,
                                                  bottom: 4),
                                              child: Text(
                                                heightP.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        /* Weight */
                                        Positioned(
                                          top: 40,
                                          left: 8,
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                  top: 4,
                                                  bottom: 4),
                                              child: Text(
                                                weightP.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        /* Sombra Blanca */
                                        /*Positioned(
                                        top: 20,
                                        right: 9,
                                        child: new CachedNetworkImage(
                                          imageUrl: "${img.toString()}",
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                          color: Colors.white,
                                        ),
                                      ),*/
                                        /* Imagen de Pokemon */
                                        Positioned(
                                          top: 30,
                                          right: 5,
                                          child: Hero(
                                            tag: index,
                                            child: CachedNetworkImage(
                                              imageUrl: img,
                                              height: 100,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  //Todo navegador nuevo necesita un screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => DetailsObjectScreen(
                                              objectDetail:
                                                  snapshot.data![index],
                                              color: type == 'Grass'
                                                  ? Colors.greenAccent
                                                  : type == 'Fire'
                                                      ? Colors.red
                                                      : type == 'Water'
                                                          ? Colors.blue
                                                          : type == 'Bug'
                                                              ? Colors
                                                                  .greenAccent
                                                              : type == 'Normal'
                                                                  ? Colors
                                                                      .blueGrey
                                                                  : type ==
                                                                          'Poison'
                                                                      ? Colors
                                                                          .purple
                                                                      : type ==
                                                                              'Electric'
                                                                          ? Colors
                                                                              .yellowAccent
                                                                          : type == 'Ground'
                                                                              ? Colors.brown
                                                                              : type == 'Fighting'
                                                                                  ? Colors.brown
                                                                                  : type == 'Psychic'
                                                                                      ? Colors.pink
                                                                                      : type == 'Dragon'
                                                                                          ? Colors.purple
                                                                                          : type == 'Rock'
                                                                                              ? Colors.brown
                                                                                              : type == 'Ice'
                                                                                                  ? Colors.lightBlue
                                                                                                  : Colors.purple,
                                              heroTag: index,
                                            )),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Text("Failed Connect ${snapshot.error}");
                    } else {
                      return const CircularProgressIndicator(
                        color: Colors.black,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // void fetchPokemonData() async {
  //   var url = Uri.https("raw.githubusercontent.com",
  //       "/Biuni/PokemonGO-Pokedex/master/pokedex.json", {'q': '{http}'});
  //   var response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     var decodedJsonData = jsonDecode(response.body);
  //     pokedex = decodedJsonData['pokemon'];
  //     /*int i = 0;
  //     while (i < 5) {
  //       print(
  //           'Nombre de pokemon: ${pokedex[i]['name']} Peso: ${pokedex[i]['img']}');
  //       i++;
  //     }*/
  //     setState(() {});
  //   }
  // }
}

/*
Expanded(
                        child: 
                      )
*/