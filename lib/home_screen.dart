import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /* ================ Consumir Api ================= */
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  List pokedex = [];

  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex Generation I"),
        backgroundColor: Color.fromRGBO(255, 170, 0, 1),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: Column(
              children: [
                pokedex != null
                    ? Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.4,
                          ),
                          itemCount: pokedex.length,
                          itemBuilder: (context, index) {
                            var id = pokedex[index]['id'];
                            var type = pokedex[index]['type'][0];
                            var name = pokedex[index]['name'];
                            var img = pokedex[index]['img'];
                            var weightP = pokedex[index]['weight'];
                            var heightP = pokedex[index]['height'];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 19, 134, 228),
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
                                        fit: BoxFit.fitHeight,
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
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                          color:
                                              Color.fromARGB(255, 255, 170, 0),
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
                                      child: new CachedNetworkImage(
                                        imageUrl: img,
                                        height: 100,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchPokemonData() async {
    var url = Uri.https("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json", {'q': '{http}'});
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedJsonData = jsonDecode(response.body);
      pokedex = decodedJsonData['pokemon'];
      /*int i = 0;
      while (i < 5) {
        print(
            'Nombre de pokemon: ${pokedex[i]['name']} Peso: ${pokedex[i]['img']}');
        i++;
      }*/
      setState(() {});
    }
  }
}
