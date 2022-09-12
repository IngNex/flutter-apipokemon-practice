import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /* ================ Consumir Api ================= */
  var Api =
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
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
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
                          "Pokemon",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 117, 98),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 45,
                        left: 15,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 4, bottom: 4),
                            child: Text(
                              "Fire",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
