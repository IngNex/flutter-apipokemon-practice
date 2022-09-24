import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsObjectScreen extends StatefulWidget {
  final objectDetail;
  final Color color;
  final int heroTag;

  const DetailsObjectScreen(
      {super.key,
      required this.objectDetail,
      required this.color,
      required this.heroTag});

  @override
  State<DetailsObjectScreen> createState() => _DetailsObjectScreenState();
}

class _DetailsObjectScreenState extends State<DetailsObjectScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 30,
            left: 5,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          /* Object name */
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              widget.objectDetail['name'],
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          /* Object name */
          Positioned(
            top: 130,
            left: 20,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                child: Text(
                  widget.objectDetail['type'].join(', '),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black26),
            ),
          ),
          /* pokeball */
          Positioned(
            top: height * 0.20,
            right: -30,
            child: Image.asset(
              'images/pokeball.png',
              height: 200,
              fit: BoxFit.fitHeight,
              color: Colors.white12.withOpacity(0.4),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          /*Cuadro Blanco*/
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Name",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(widget.objectDetail['name'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Height",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          Container(
                            width: width * 0.3,
                            child: Text(widget.objectDetail['height'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Weight",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(widget.objectDetail['weight'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Spawn Time",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(widget.objectDetail['spawn_time'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Weaknesses",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(
                                widget.objectDetail['weaknesses'].join(" - "),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Evolution",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: width * 0.55,
                            child: ListView.builder(
                              itemCount:
                                  widget.objectDetail['next_evolution'].length,
                              itemBuilder: (context, index) {
                                return Text(
                                    widget.objectDetail['next_evolution'][index]
                                        ['name']);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /* Object img */
          Positioned(
            top: height * 0.20,
            left: (width / 2) - 100,
            child: new CachedNetworkImage(
              imageUrl: widget.objectDetail['img'],
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
