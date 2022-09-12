import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                      )
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
