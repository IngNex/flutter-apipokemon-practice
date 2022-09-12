import 'dart:convert' as convert;

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
    return Scaffold(
      body: Column(
        children: [
          pokedex != null
              ? Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                    ),
                    itemCount: pokedex.length,
                    itemBuilder: (context, index) {
                      var type = pokedex[index]['type'][0];
                      return Card(
                        color: Color.fromARGB(255, 19, 228, 193),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: -50,
                              right: -50,
                              child: Image.asset(
                                'images/pokeball_nex.png',
                                height: 220,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Positioned(
                              top: 15,
                              left: 15,
                              child: Text(
                                "${pokedex[index]['name']}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 117, 98),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 8,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0, top: 4, bottom: 4),
                                  child: Text(
                                    type.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  color: Color.fromARGB(153, 13, 34, 219),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 9,
                              right: 9,
                              child: CachedNetworkImage(
                                imageUrl: "${pokedex[index]['img']}",
                                color: Colors.white,
                              ),
                            ),
                          ],
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
    );
  }

  void fetchPokemonData() async {
    var url = Uri.https("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json", {'q': '{http}'});
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedJsonData = convert.jsonDecode(response.body);
      pokedex = decodedJsonData['pokemon'];
      /*int i = 0;
      while (i < 20) {
        print(
            'Nombre de pokemon: ${pokedex[i]['name']} Peso: ${pokedex[i]['weight']}');
        i++;
      }*/
      setState(() {});
    }
  }
}
